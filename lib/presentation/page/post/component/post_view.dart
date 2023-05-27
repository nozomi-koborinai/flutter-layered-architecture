import 'package:flutter/material.dart';
import 'package:flutter_reference_app_2/application/usecase/post/post_usecase.dart';
import 'package:flutter_reference_app_2/presentation/page/post/component/post_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/post/entity/post.dart';

/// 全投稿取得のための FutureProvider
final postsProvider = FutureProvider.autoDispose<List<Post>>(
  (ref) async => ref.watch(postUsecaseProvider).fetchAllPosts(),
);

/// 投稿一覧
class PostView extends ConsumerWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(postsProvider).when(
          data: (posts) {
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                return PostItem(post: posts[index]);
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        );
  }
}
