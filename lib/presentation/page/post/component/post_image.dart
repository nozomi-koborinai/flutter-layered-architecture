import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

/// 選択中投稿画像を保持するプロバイダー
final selectedPostImageProvider = StateProvider.autoDispose<File?>((_) => null);

class PostImage extends ConsumerWidget {
  const PostImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPostImage = ref.watch(selectedPostImageProvider);
    return GestureDetector(
      onTap: () async {
        final picker = ImagePicker();
        final pickedFile = await picker.pickImage(source: ImageSource.gallery);
        if (pickedFile == null) return;
        ref.watch(selectedPostImageProvider.notifier).state =
            File(pickedFile.path);
      },
      child: Container(
        height: 200,
        width: double.infinity,
        color: Colors.grey[300],
        child: selectedPostImage == null
            ? Icon(Icons.camera_alt, color: Colors.grey[800])
            : Image.file(selectedPostImage),
      ),
    );
  }
}
