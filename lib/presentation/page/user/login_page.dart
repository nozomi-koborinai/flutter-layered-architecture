import 'package:flutter/material.dart';
import 'package:flutter_reference_app_2/presentation/page/user/component/signin_button.dart';
import 'package:flutter_reference_app_2/presentation/page/user/component/signup_text_button.dart';
import 'package:flutter_reference_app_2/presentation/page/user/component/text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SNS'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmailTextField(),
            SizedBox(height: 16.0),
            PasswordTextField(),
            SizedBox(height: 16.0),
            SigninButton(),
            SizedBox(height: 16.0),
            SignupTextButton(),
          ],
        ),
      ),
    );
  }
}
