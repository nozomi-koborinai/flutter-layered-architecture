import 'dart:io';

import 'package:flutter_reference_app_2/application/usecase/run_usecase_mixin.dart';
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
      await userRepository.signUp(email: email, password: password);
    });
  }

  /// サインイン
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await execute(ref, () async {
      await userRepository.signIn(email: email, password: password);
    });
  }

  /// ユーザー情報追加
  Future<void> registerUser({
    required String? uid,
    required String userName,
    required File? image,
  }) async {
    if (uid == null || image == null) return;
    await execute(ref, () async {
      final imageUrl = await storageService.uploadImage(image: image);
      final user = User(id: uid, userName: userName, imageUrl: imageUrl);
      await userRepository.register(user: user);
    });
  }
}
