import 'package:flutter/material.dart';
import 'package:flutter_layered_architecture/presentation/page/user/component/signup_button.dart';
import 'package:flutter_layered_architecture/presentation/page/user/component/text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('サインアップ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            EmailTextField(
              controller: ref.watch(signupEmailControllerProvider),
            ),
            const SizedBox(height: 16),
            PasswordTextField(
              controller: ref.watch(signUpPasswordControllerProvider),
            ),
            const SizedBox(height: 16),
            const SignupButton(),
          ],
        ),
      ),
    );
  }
}
