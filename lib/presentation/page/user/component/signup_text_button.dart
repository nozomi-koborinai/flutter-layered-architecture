import 'package:flutter/material.dart';

class SignupTextButton extends StatelessWidget {
  const SignupTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // 新規ユーザー登録画面へ遷移する処理をここに書く
      },
      child: const Text('Sign up'),
    );
  }
}
