import 'dart:io';

import 'package:flutter_layered_architecture/application/usecase/run_usecase_mixin.dart';
import 'package:flutter_layered_architecture/application/usecase/user/state/user_provider.dart';
import 'package:flutter_layered_architecture/domain/service/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/user/entity/user.dart';
import '../../../domain/user/user_repository.dart';
import '../../state/overlay_loading_provider.dart';

/// ユーザーユースケースプロバイダー
final userUsecaseProvider = Provider<UserUsecase>(
  UserUsecase.new,
);

/// ユーザーに関するユースケースを実現するためのクラス
class UserUsecase with RunUsecaseMixin {
  UserUsecase(this._ref);

  final Ref _ref;

  UserRepository get _userRepository => _ref.read(userRepositoryProvider);
  StorageService get _storageService => _ref.read(storageServiceProvider);
  CurrentUser get _currentUser => _ref.read(userProvider.notifier);
  StateController<bool> get _loadingController =>
      _ref.read(overlayLoadingProvider.notifier);
  StateController<String?> get _uidController =>
      _ref.read(uidProvider.notifier);

  /// サインアップ
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    await execute(
        loadingController: _loadingController,
        action: () async {
          final uid = await _userRepository.signUp(
            email: email,
            password: password,
          );
          _uidController.state = uid;
        });
  }

  /// サインイン
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await execute(
        loadingController: _loadingController,
        action: () async {
          final user = await _userRepository.signIn(
            email: email,
            password: password,
          );
          _uidController.state = user.id;
          _currentUser.set(user);
        });
  }

  /// ユーザー情報追加 または 更新
  Future<void> registerUser({
    required String? uid,
    required String userName,
    required File? image,
  }) async {
    if (uid == null) return;
    await execute(
        loadingController: _loadingController,
        action: () async {
          var imageUrl = '';
          if (image != null) {
            imageUrl = await _storageService.uploadImage(image: image);
          }
          final user = User(id: uid, userName: userName, imageUrl: imageUrl);
          final updatedUser = await _userRepository.register(user: user);
          _currentUser.set(updatedUser);
        });
  }
}
