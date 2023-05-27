import 'dart:io';

/// 非構造ファイルを保存したり取得したりするサービス
abstract interface class StorageService {
  /// 指定した画像をストレージにアップロード
  Future<String> uploadImage({required File image});
}
