import 'package:flutter/material.dart';
import 'package:flutter_layered_architecture/presentation/page/user/profile_edit_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/usecase/user/state/user_provider.dart';
import 'component/user_image.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userName = ref.watch(userProvider)?.userName;
    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール'),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileEditPage()),
                );
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const UserImage(),
              const SizedBox(height: 16.0),
              Text(
                userName ?? '',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
