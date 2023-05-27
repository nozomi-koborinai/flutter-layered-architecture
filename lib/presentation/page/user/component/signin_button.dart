import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/usecase/user/state/text_controller_provider.dart';

/// サインインボタン
class SigninButton extends ConsumerWidget {
  const SigninButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        print(ref.watch(emailControllerProvider).text);
        print(ref.watch(passwordControllerProvider).text);
      },
      child: const Text('Sign in'),
    );
  }
}
