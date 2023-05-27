import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ストレージサービスプロバイダー
/// アプリ起動時 or テスト時に本プロバイダーを override して使用してください
final storageServiceProvider = Provider<StorageService>(
  (_) => throw UnimplementedError(),
);

/// 非構造ファイルを保存したり取得したりするサービス
abstract interface class StorageService {
  /// 指定した画像をストレージにアップロード
  Future<String> uploadImage({required File image});
}
