import 'package:flutter/material.dart';
import 'package:flutter_reference_app_2/application/usecase/user/user_usecase.dart';
import 'package:flutter_reference_app_2/presentation/page/user/component/text_field.dart';
import 'package:flutter_reference_app_2/presentation/page/user/profile_edit_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupButton extends ConsumerWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      child: const Text('サインアップ'),
      onPressed: () async {
        await ref.watch(userUsecaseProvider).signUp(
              email: ref.watch(signupEmailControllerProvider).text,
              password: ref.watch(signUpPasswordControllerProvider).text,
            );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileEditPage()),
        );
      },
    );
  }
}
