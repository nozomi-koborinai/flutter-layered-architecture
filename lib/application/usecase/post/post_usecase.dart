import 'dart:io';

import 'package:flutter_reference_app_2/application/usecase/post/state/posts_provider.dart';
import 'package:flutter_reference_app_2/domain/service/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/post/entity/post.dart';
import '../../../domain/post/post_repository.dart';
import '../../../domain/user/entity/user.dart';
import '../run_usecase_mixin.dart';

/// 投稿ユースケースプロバイダー
final postUsecaseProvider = Provider<PostUsecase>(
  PostUsecase.new,
);

/// 投稿ユースケース
class PostUsecase with RunUsecaseMixin {
  PostUsecase(this.ref) {
    postRepository = ref.watch(postRepositoryProvider);
    storageService = ref.watch(storageServiceProvider);
  }
  final Ref ref;
  late PostRepository postRepository;
  late StorageService storageService;

  /// 新規投稿をする
  Future<void> addPost({
    required File? image,
    required String comment,
    required User? user,
  }) async {
    if (image == null || user == null) return;
    await execute(ref, () async {
      final imageUrl = await storageService.uploadImage(image: image);
      await postRepository.add(
        post: Post(
          id: null,
          user: user,
          imageUrl: imageUrl,
          comment: comment,
          createdAt: null,
        ),
      );
      ref.invalidate(postsProvider);
    });
  }
}
