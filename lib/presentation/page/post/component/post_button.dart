import 'package:flutter/material.dart';
import 'package:flutter_reference_app_2/application/usecase/post/post_usecase.dart';
import 'package:flutter_reference_app_2/application/usecase/user/state/user_provider.dart';
import 'package:flutter_reference_app_2/presentation/error_handler_mixin.dart';
import 'package:flutter_reference_app_2/presentation/page/post/component/post_comment_field.dart';
import 'package:flutter_reference_app_2/presentation/page/post/component/post_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostButton extends ConsumerWidget with ErrorHandlerMixin {
  const PostButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        execute(
          context,
          action: () async {
            final navigator = Navigator.of(context);
            await ref.read(postUsecaseProvider).addPost(
                  image: ref.read(selectedPostImageProvider),
                  comment: ref.read(postCommentControllerProvider).text,
                  user: ref.read(userProvider),
                );
            navigator.pop();
          },
          successMessage: '投稿が完了しました',
        );
      },
      child: const Text('投稿'),
    );
  }
}
