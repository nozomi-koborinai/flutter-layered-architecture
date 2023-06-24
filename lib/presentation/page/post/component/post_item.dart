import 'package:flutter/material.dart';
import 'package:flutter_layered_architecture/presentation/view_utils.dart';

import '../../../../domain/post/entity/post.dart';

/// 1 投稿を表示するためのウィジェット
class PostItem extends StatelessWidget {
  // in: 表示対象の投稿エンティティ
  const PostItem({required this.post, super.key});

  final Post post;

  @override
  Widget build(BuildContext context) {
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
              // 画面表示に関するものはプレゼンテーション層の責務なのでドメイン層で変換処理はせず utility クラスを使用
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
