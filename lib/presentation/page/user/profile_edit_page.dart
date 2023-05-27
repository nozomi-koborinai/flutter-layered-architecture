import 'package:flutter/material.dart';
import 'package:flutter_reference_app_2/presentation/page/user/component/register_button.dart';
import 'package:flutter_reference_app_2/presentation/page/user/component/text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'component/user_image_edit.dart';

class ProfileEditPage extends ConsumerWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Edit'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            UserImageEdit(),
            SizedBox(height: 16.0),
            UserNameTextField(),
            SizedBox(height: 16.0),
            RegisterButton(),
          ],
        ),
      ),
    );
  }
}
