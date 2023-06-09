import 'package:flutter/material.dart';
import 'package:flutter_layered_architecture/application/usecase/user/user_usecase.dart';
import 'package:flutter_layered_architecture/presentation/presentation_mixin.dart';
import 'package:flutter_layered_architecture/presentation/page/user/component/text_field.dart';
import 'package:flutter_layered_architecture/presentation/page/user/profile_edit_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home_page.dart';

class SignupButton extends ConsumerWidget with PresentationMixin {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      child: const Text('サインアップ'),
      onPressed: () async {
        execute(
          context,
          action: () async {
            final navigator = Navigator.of(context);
            await ref.read(userUsecaseProvider).signUp(
                  email: ref.read(signupEmailControllerProvider).text,
                  password: ref.read(signUpPasswordControllerProvider).text,
                );
            ref.watch(currentIndexProvider.notifier).state =
                IndexMode.profile.index;
            navigator.pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
              (route) => false,
            );
            navigator.push(
              MaterialPageRoute(
                builder: (context) => const ProfileEditPage(),
              ),
            );
          },
          successMessage: 'サインアップが完了しました',
        );
      },
    );
  }
}
