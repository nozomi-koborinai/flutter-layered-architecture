import 'package:flutter/material.dart';
import 'package:flutter_reference_app_2/application/usecase/user/state/text_controller_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Email アドレス入力用テキストフィールド
class EmailTextField extends ConsumerWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: ref.watch(emailControllerProvider),
      decoration: const InputDecoration(
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
    return TextField(
      controller: ref.watch(passwordControllerProvider),
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
      obscureText: true,
    );
  }
}
