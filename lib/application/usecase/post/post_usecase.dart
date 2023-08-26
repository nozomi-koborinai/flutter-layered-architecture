import 'dart:io';

import 'package:flutter_layered_architecture/application/state/overlay_loading_provider.dart';
import 'package:flutter_layered_architecture/domain/app_exception.dart';
import 'package:flutter_layered_architecture/domain/service/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/post/entity/post.dart';
import '../../../domain/post/post_repository.dart';
import '../../../domain/user/entity/user.dart';
import '../run_usecase_mixin.dart';
import 'state/posts_provider.dart';

/// 投稿ユースケースプロバイダー
final postUsecaseProvider = Provider<PostUsecase>(
  PostUsecase.new,
);

/// 投稿ユースケース
class PostUsecase with RunUsecaseMixin {
  PostUsecase(this._ref);

  final Ref _ref;

  PostRepository get _postRepository => _ref.read(postRepositoryProvider);
  StorageService get _storageService => _ref.read(storageServiceProvider);
  StateController<bool> get _loadingController =>
      _ref.read(overlayLoadingProvider.notifier);
  void _invalidatePostsProvider() => _ref.invalidate(postsProvider);

  /// 新規投稿をする
  Future<void> addPost({
    required File? image,
    required String comment,
    required User? user,
  }) async {
    if (image == null) {
      throw const AppException('画像を選択してください');
    }
    if (user == null) {
      throw const AppException();
    }
    await execute(
        loadingController: _loadingController,
        action: () async {
          final imageUrl = await _storageService.uploadImage(image: image);
          await _postRepository.add(
            post: Post(
              id: null,
              user: user,
              imageUrl: imageUrl,
              comment: comment,
              createdAt: DateTime.now(),
            ),
          );
        });
    _invalidatePostsProvider();
  }

  /// 投稿の全件取得処理
  ///
  /// 取得後に作成日時が新しい順に並び替える
  Future<List<Post>> fetchAll() async {
    final posts = await execute(action: () async {
      return await _postRepository.fetchAll();
    });

    final sortedPosts = posts
      ..sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    return sortedPosts;
  }
}
