import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/user/entity/user.dart';

/// 認証後ユーザーの user id を保持するプロバイダー
final uidProvider = StateProvider<String?>((_) => null);

/// 認証後ユーザーの情報を保持するプロバイダー
final userProvider = NotifierProvider<CurrentUser, User?>(CurrentUser.new);

class CurrentUser extends Notifier<User?> {
  @override
  User? build() {
    return null;
  }

  void set(User? user) => state = user?.copyWith();
}
