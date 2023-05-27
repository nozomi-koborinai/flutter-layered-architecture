import 'package:flutter/material.dart';

/// Email アドレス入力用テキストフィールド
class EmailTextField extends StatelessWidget {
  const EmailTextField({
    required this.controller,
    super.key,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Email Address',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}

/// Password 入力用テキストフィールド
class PasswordTextField extends StatelessWidget {
  const PasswordTextField({required this.controller, super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
      obscureText: true,
    );
  }
}
