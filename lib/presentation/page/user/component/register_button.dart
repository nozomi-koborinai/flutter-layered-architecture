import 'package:flutter/material.dart';
import 'package:flutter_reference_app_2/application/usecase/user/state/user_provider.dart';
import 'package:flutter_reference_app_2/application/usecase/user/user_usecase.dart';
import 'package:flutter_reference_app_2/presentation/error_handler_mixin.dart';
import 'package:flutter_reference_app_2/presentation/page/home_page.dart';
import 'package:flutter_reference_app_2/presentation/page/user/component/text_field.dart';
import 'package:flutter_reference_app_2/presentation/page/user/component/user_image_edit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterButton extends ConsumerWidget with ErrorHandlerMixin {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        execute(
          context,
          ref,
          action: () async {
            await ref.read(userUsecaseProvider).registerUser(
                  uid: ref.watch(uidProvider),
                  userName: ref.watch(userNameControllerProvider).text,
                  image: ref.watch(selectedImageProvider),
                );
            ref.watch(currentIndexProvider.notifier).state =
                IndexMode.profile.index;
            Navigator.of(context).pop();
          },
          successMessage: 'プロフィールを登録しました',
        );
      },
      child: const Text('登録'),
    );
  }
}
