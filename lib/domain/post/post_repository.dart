import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'entity/post.dart';

/// 投稿リポジトリプロバイダー
/// アプリ起動時 or テスト時に本プロバイダーを override して使用してください
final postRepositoryProvider = Provider<PostRepository>(
  (_) => throw UnimplementedError(),
);

/// Post テーブルに関するリポジトリ
abstract interface class PostRepository {
  /// 投稿情報追加
  Future<void> add({required Post post});

  /// 投稿情報変更
  Future<void> update({required Post post});

  /// 投稿情報削除
  Future<void> delete({required String postId});

  /// 投稿情報取得
  Future<Post> fetch({required String postId});

  /// 全投稿情報取得
  Future<List<Post>> fetchAll();

  /// 投稿画像をストレージにアップロード
  Future<String> uploadImage({required File image});
}
