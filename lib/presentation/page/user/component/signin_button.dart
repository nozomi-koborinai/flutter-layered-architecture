import 'package:flutter/material.dart';

/// サインインボタン
class SigninButton extends StatelessWidget {
  const SigninButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // ログイン処理をここに書く
      },
      child: const Text('Sign in'),
    );
  }
}
