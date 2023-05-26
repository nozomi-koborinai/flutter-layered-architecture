import 'dart:io';

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
    postRepository = ref.read(postRepositoryProvider);
  }
  final Ref ref;
  late PostRepository postRepository;

  /// 新規投稿をする
  Future<void> addPost({
    required File image,
    required String comment,
    required User user,
  }) async {
    await execute(ref, () async {
      final imageUrl = await postRepository.uploadImage(image: image);
      await postRepository.add(
        post: Post(
          id: null,
          user: user,
          imageUrl: imageUrl,
          comment: comment,
          createdAt: null,
        ),
      );
    });
  }

  /// 全投稿情報を取得する
  Future<List<Post>> fetchAllPosts() async {
    return await execute(ref, () async {
      return await postRepository.fetchAll();
    });
  }
}
