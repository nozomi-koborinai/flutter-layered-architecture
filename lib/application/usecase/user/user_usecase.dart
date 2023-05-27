import 'dart:io';

import 'package:flutter_reference_app_2/application/usecase/run_usecase_mixin.dart';
import 'package:flutter_reference_app_2/application/usecase/user/state/user_provider.dart';
import 'package:flutter_reference_app_2/domain/service/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/user/entity/user.dart';
import '../../../domain/user/user_repository.dart';

/// ユーザーユースケースプロバイダー
final userUsecaseProvider = Provider<UserUsecase>(
  UserUsecase.new,
);

/// ユーザーに関するユースケースを実現するためのクラス
class UserUsecase with RunUsecaseMixin {
  UserUsecase(this.ref) {
    userRepository = ref.watch(userRepositoryProvider);
    storageService = ref.watch(storageServiceProvider);
  }
  final Ref ref;
  late UserRepository userRepository;
  late StorageService storageService;

  /// サインアップ
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    await execute(ref, () async {
      final uid = await userRepository.signUp(
        email: email,
        password: password,
      );
      ref.watch(uidProvider.notifier).state = uid;
    });
  }

  /// サインイン
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await execute(ref, () async {
      final user = await userRepository.signIn(
        email: email,
        password: password,
      );
      ref.watch(uidProvider.notifier).state = user.id;
      ref.watch(userProvider.notifier).state = user;
    });
  }

  /// ユーザー情報追加 または 更新
  Future<void> registerUser({
    required String? uid,
    required String userName,
    required File? image,
  }) async {
    if (uid == null || image == null) return;
    await execute(ref, () async {
      final imageUrl = await storageService.uploadImage(image: image);
      final user = User(id: uid, userName: userName, imageUrl: imageUrl);
      final updatedUser = await userRepository.register(user: user);
      ref.watch(userProvider.notifier).state = updatedUser;
    });
  }
}
