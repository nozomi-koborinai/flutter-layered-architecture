import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// String 型（yyyy/MM/dd フォーマット）に変換
  String get toFormatDateString {
    return DateFormat('yyyy/MM/dd').format(this);
  }
}
