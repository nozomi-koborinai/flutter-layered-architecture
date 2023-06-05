import 'dart:io';

import 'package:flutter_reference_app_2/application/usecase/run_usecase_mixin.dart';
import 'package:flutter_reference_app_2/application/usecase/user/state/user_provider.dart';
import 'package:flutter_reference_app_2/domain/service/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/user/entity/user.dart';
import '../../../domain/user/user_repository.dart';
import '../../state/overlay_loading_provider.dart';

/// ユーザーユースケースプロバイダー
final userUsecaseProvider = Provider<UserUsecase>(
  (ref) => UserUsecase(
    userRepository: ref.watch(userRepositoryProvider),
    storageService: ref.watch(storageServiceProvider),
    currentUser: ref.watch(userProvider.notifier),
    loadingController: ref.watch(overlayLoadingProvider.notifier),
    uidController: ref.watch(uidProvider.notifier),
  ),
);

/// ユーザーに関するユースケースを実現するためのクラス
class UserUsecase with RunUsecaseMixin {
  UserUsecase({
    required this.userRepository,
    required this.storageService,
    required this.currentUser,
    required this.loadingController,
    required this.uidController,
  });

  final UserRepository userRepository;
  final StorageService storageService;
  final CurrentUser currentUser;
  final StateController<bool> loadingController;
  final StateController<String?> uidController;

  /// サインアップ
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    await execute(loadingController, () async {
      final uid = await userRepository.signUp(
        email: email,
        password: password,
      );
      uidController.state = uid;
    });
  }

  /// サインイン
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await execute(loadingController, () async {
      final user = await userRepository.signIn(
        email: email,
        password: password,
      );
      uidController.state = user.id;
      currentUser.set(user);
    });
  }

  /// ユーザー情報追加 または 更新
  Future<void> registerUser({
    required String? uid,
    required String userName,
    required File? image,
  }) async {
    if (uid == null) return;
    await execute(loadingController, () async {
      var imageUrl = '';
      if (image != null) {
        imageUrl = await storageService.uploadImage(image: image);
      }
      final user = User(id: uid, userName: userName, imageUrl: imageUrl);
      final updatedUser = await userRepository.register(user: user);
      currentUser.set(updatedUser);
    });
  }
}
