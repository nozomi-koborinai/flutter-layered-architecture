/// アプリ内共通で使用する例外クラス
class AppException implements Exception {
  /// ユーザーに表示するメッセージ
  /// 指定しない場合はデフォルトのメッセージを表示する
  final String message;
  const AppException([this.message = 'エラーが発生しました']);

  @override
  String toString() {
    return message;
  }
}
