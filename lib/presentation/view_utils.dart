import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'component/failure_snackbar.dart';
import 'component/success_snackbar.dart';

/// View に関するUtility メソッド群
class ViewUtils {
  /// singleton
  ViewUtils._();
  static final instance = ViewUtils._();

  /// スナックバー表示
  void showSnackBar(
    ScaffoldMessengerState scaffoldMessenger, {
    required String message,
    SnackBarMode mode = SnackBarMode.success,
  }) {
    final snackBar = mode == SnackBarMode.success
        ? SuccessSnackBar(message: message)
        : FailureSnackBar(message: message);
    scaffoldMessenger.showSnackBar(snackBar);
  }

  /// DateTime 型 を String 型（yyyy/MM/dd フォーマット）に変換
  String formatDateToString(DateTime dateTime) {
    return DateFormat('yyyy/MM/dd').format(dateTime);
  }
}

/// スナックバー表示モード
enum SnackBarMode {
  /// 成功
  success,

  /// 失敗
  failure,
}
