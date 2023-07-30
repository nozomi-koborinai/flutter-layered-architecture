import 'package:intl/intl.dart';

/// View に関するUtility メソッド群
class ViewUtils {
  /// singleton
  ViewUtils._();
  static final instance = ViewUtils._();

  /// DateTime 型 を String 型（yyyy/MM/dd フォーマット）に変換
  String formatDateToString(DateTime dateTime) {
    return DateFormat('yyyy/MM/dd').format(dateTime);
  }
}
