import 'package:flutter/material.dart';
import 'package:flutter_reference_app_2/application/usecase/user/user_usecase.dart';
import 'package:flutter_reference_app_2/presentation/error_handler_mixin.dart';
import 'package:flutter_reference_app_2/presentation/page/user/component/text_field.dart';
import 'package:flutter_reference_app_2/presentation/page/user/profile_edit_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home_page.dart';

class SignupButton extends ConsumerWidget with ErrorHandlerMixin {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      child: const Text('サインアップ'),
      onPressed: () async {
        execute(
          context,
          ref,
          action: () async {
            await ref.watch(userUsecaseProvider).signUp(
                  email: ref.watch(signupEmailControllerProvider).text,
                  password: ref.watch(signUpPasswordControllerProvider).text,
                );
            ref.watch(currentIndexProvider.notifier).state =
                IndexMode.profile.index;
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
              (route) => false,
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileEditPage(),
              ),
            );
          },
          successMessage: 'サインアップが完了しました',
        );
      },
    );
  }
}
