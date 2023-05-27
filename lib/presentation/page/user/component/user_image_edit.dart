import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_reference_app_2/application/usecase/user/state/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

/// 選択中画像を保持するプロバイダー
final selectedImageProvider = StateProvider<File?>((_) => null);

class UserImageEdit extends ConsumerWidget {
  const UserImageEdit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedImage = ref.watch(selectedImageProvider);
    final user = ref.watch(userProvider);
    return CircleAvatar(
      radius: 50,
      backgroundImage: selectedImage != null
          ? FileImage(selectedImage)
          : user == null
              ? null
              : NetworkImage(user.imageUrl) as ImageProvider<Object>?,
      child: Padding(
        padding: const EdgeInsets.only(top: 65.0, left: 67.5),
        child: IconButton(
          icon: const Icon(Icons.add_a_photo_rounded),
          onPressed: () async {
            final picker = ImagePicker();
            final pickedFile =
                await picker.pickImage(source: ImageSource.gallery);
            if (pickedFile == null) return;
            ref.watch(selectedImageProvider.notifier).state =
                File(pickedFile.path);
          },
        ),
      ),
    );
  }
}
