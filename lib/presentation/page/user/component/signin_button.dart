import 'package:flutter/material.dart';
import 'package:flutter_reference_app_2/application/usecase/user/user_usecase.dart';
import 'package:flutter_reference_app_2/presentation/page/user/component/text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// サインインボタン
class SigninButton extends ConsumerWidget {
  const SigninButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () => ref.watch(userUsecaseProvider).signIn(
            email: ref.watch(signinEmailControllerProvider).text,
            password: ref.watch(signinPasswordControllerProvider).text,
          ),
      child: const Text('Sign in'),
    );
  }
}
