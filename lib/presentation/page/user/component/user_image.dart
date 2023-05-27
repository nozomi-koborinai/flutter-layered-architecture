import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_reference_app_2/application/usecase/user/state/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

/// 選択中画像を保持するプロバイダー
final selectedImageProvider = StateProvider<File?>((_) => null);

class UserImage extends ConsumerWidget {
  const UserImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return CircleAvatar(
      radius: 50,
      backgroundImage: user == null ? null : NetworkImage(user.imageUrl),
      child: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () async {
          final picker = ImagePicker();
          final pickedFile =
              await picker.pickImage(source: ImageSource.gallery);
          if (pickedFile == null) return;
          ref.watch(selectedImageProvider.notifier).state =
              File(pickedFile.path);
        },
      ),
    );
  }
}
