import 'package:flutter/material.dart';
import 'package:flutter_reference_app_2/application/usecase/user/state/text_controller_provider.dart';
import 'package:flutter_reference_app_2/presentation/page/user/component/signin_button.dart';
import 'package:flutter_reference_app_2/presentation/page/user/component/signup_text_button.dart';
import 'package:flutter_reference_app_2/presentation/page/user/component/text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SigninPage extends ConsumerWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmailTextField(
              controller: ref.watch(signinEmailControllerProvider),
            ),
            const SizedBox(height: 16.0),
            PasswordTextField(
              controller: ref.watch(signinPasswordControllerProvider),
            ),
            const SizedBox(height: 16.0),
            const SigninButton(),
            const SizedBox(height: 16.0),
            const SignupTextButton(),
          ],
        ),
      ),
    );
  }
}
