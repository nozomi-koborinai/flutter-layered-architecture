import 'package:flutter/material.dart';
import 'package:flutter_layered_architecture/presentation/page/post/component/post_button.dart';
import 'package:flutter_layered_architecture/presentation/page/post/component/post_comment_field.dart';
import 'package:flutter_layered_architecture/presentation/page/post/component/post_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostPage extends ConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新しい写真投稿'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              PostImage(),
              SizedBox(height: 16),
              PostCommentField(),
              SizedBox(height: 16),
              PostButton(),
            ],
          ),
        ),
      ),
    );
  }
}
