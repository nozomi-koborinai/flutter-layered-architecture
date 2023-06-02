import 'package:flutter/material.dart';
import 'package:flutter_reference_app_2/application/usecase/user/user_usecase.dart';
import 'package:flutter_reference_app_2/presentation/error_handler_mixin.dart';
import 'package:flutter_reference_app_2/presentation/page/home_page.dart';
import 'package:flutter_reference_app_2/presentation/page/user/component/text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// サインインボタン
class SigninButton extends ConsumerWidget with ErrorHandlerMixin {
  const SigninButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        execute(
          context,
          action: () async {
            final navigator = Navigator.of(context);
            await ref.read(userUsecaseProvider).signIn(
                  email: ref.read(signinEmailControllerProvider).text,
                  password: ref.read(signinPasswordControllerProvider).text,
                );
            navigator.pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          successMessage:
              '${ref.read(signinEmailControllerProvider).text} のユーザーでサインインしました',
        );
      },
      child: const Text('サインイン'),
    );
  }
}
