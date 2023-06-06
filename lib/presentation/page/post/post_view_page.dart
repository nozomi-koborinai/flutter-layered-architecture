import 'package:flutter/material.dart';
import 'package:flutter_layered_architecture/presentation/page/post/component/post_view.dart';
import 'package:flutter_layered_architecture/presentation/page/post/post_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostViewPage extends ConsumerWidget {
  const PostViewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('投稿リスト'),
        automaticallyImplyLeading: false,
      ),
      body: const PostView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PostPage(),
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.photo_camera),
      ),
    );
  }
}
