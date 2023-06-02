import 'package:flutter/material.dart';
import 'package:flutter_reference_app_2/presentation/view_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/post/entity/post.dart';

/// 1 投稿を表示するためのウィジェット
class PostItem extends ConsumerWidget {
  const PostItem({required this.post, super.key});

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(post.user.imageUrl),
            ),
            title: Text(post.user.userName),
            subtitle: Text(
              ViewUtils.instance.formatDateToString(post.createdAt!),
              style: const TextStyle(fontSize: 12.0),
            ),
          ),
          Image.network(
            post.imageUrl,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(post.comment),
          ),
        ],
      ),
    );
  }
}
