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

  /// stateの更新方法に一貫性を持たせるために、プロパティごとではなくインスタンス全てを更新するメソッド
  ///
  /// Userを更新する際には、呼び出し元でインスタンス自体を渡すことで更新する
  /// Userの変更を追いやすくするために、個別のプロパティ更新用のメソッドは用意せず本メソッドからのみ変更可能にしておく
  /// 呼び出し元でのインスタンスの変更の影響が及ばないように、値の同じインスタンスをcopyWithで再生成してstateを更新する
  void set(User? user) => state = user?.copyWith();
}
