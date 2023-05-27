import 'package:flutter/material.dart';
import 'package:flutter_reference_app_2/application/usecase/user/state/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserImage extends ConsumerWidget {
  const UserImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return CircleAvatar(
      radius: 50,
      backgroundImage: user == null ? null : NetworkImage(user.imageUrl),
    );
  }
}
