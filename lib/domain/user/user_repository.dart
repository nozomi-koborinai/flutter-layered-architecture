import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'entity/user.dart';

/// ユーザーリポジトリプロバイダー
/// アプリ起動時 or テスト時に本プロバイダーを override して使用してください
final userRepositoryProvider = Provider<UserRepository>(
  (_) => throw UnimplementedError(),
);

/// User テーブル 及び 認証 に関するリポジトリ
abstract interface class UserRepository {
  /// サインアップ
  Future<void> signUp({
    required String email,
    required String password,
  });

  /// サインイン
  Future<void> signIn({
    required String email,
    required String password,
  });

  /// User テーブルへユーザーレコードを追加
  Future<void> add({required User user});

  /// User テーブル内のユーザーレコードを更新
  Future<void> update({required User user});

  /// User テーブル内のユーザーレコードを削除
  Future<void> delete({required String uid});

  /// User テーブル内のユーザーレコードを取得
  Future<User> fetch({required String uid});
}
