import 'package:flutter/material.dart';
import 'package:flutter_reference_app_2/presentation/page/user/component/text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileEditPage extends ConsumerWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Edit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: const NetworkImage(
                  'https://avatars.githubusercontent.com/u/39579511?s=40&v=4'),
              child: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // TODO: ここで画像選択処理を実装してください。
                },
              ),
            ),
            const SizedBox(height: 16.0),
            const UserNameTextField(),
          ],
        ),
      ),
    );
  }
}
