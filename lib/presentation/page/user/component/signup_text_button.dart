import 'package:flutter/material.dart';
import 'package:flutter_reference_app_2/presentation/page/user/signup_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupTextButton extends ConsumerWidget {
  const SignupTextButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignupPage()),
        );
      },
      child: const Text('アカウントをお持ちでない場合は登録'),
    );
  }
}
