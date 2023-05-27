import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// サインインボタン
class SigninButton extends ConsumerWidget {
  const SigninButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Sign in'),
    );
  }
}
