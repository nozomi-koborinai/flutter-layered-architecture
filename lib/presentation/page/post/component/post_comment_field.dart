import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 投稿コメント入力用のテキストコントローラープロバイダー
final postCommentControllerProvider =
    StateProvider.autoDispose<TextEditingController>(
  (_) => TextEditingController(),
);

class PostCommentField extends ConsumerWidget {
  const PostCommentField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: ref.watch(postCommentControllerProvider),
      decoration: const InputDecoration(
        labelText: 'コメント',
        border: OutlineInputBorder(),
      ),
      maxLines: 4,
    );
  }
}
