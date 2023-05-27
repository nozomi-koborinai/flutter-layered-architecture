import 'package:flutter/material.dart';

/// 処理失敗(エラー)用のスナックバー
class FailureSnackBar extends SnackBar {
  FailureSnackBar({super.key, required String message})
      : super(
          content: Text(message),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        );
}
