import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Email アドレス入力用テキストフィールド
class EmailTextField extends ConsumerWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const TextField(
      // TODO：テキストコントローラー配置
      decoration: InputDecoration(
        labelText: 'Email Address',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}

/// Password 入力用テキストフィールド
class PasswordTextField extends ConsumerWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const TextField(
      // TODO：テキストコントローラー配置
      decoration: InputDecoration(
        labelText: 'Password',
      ),
      obscureText: true,
    );
  }
}
