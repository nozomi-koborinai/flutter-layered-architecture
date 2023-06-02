import 'package:flutter/material.dart';
import 'package:flutter_reference_app_2/presentation/view_utils.dart';

/// プレゼンテーション層で共通エラーハンドリングを行う Mixin
mixin ErrorHandlerMixin {
  Future<void> execute(
    BuildContext context, {
    required Future<void> Function() action,
    required String successMessage,
  }) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      await action();
      ViewUtils.instance.showSnackBar(
        scaffoldMessenger,
        message: successMessage,
      );
    } catch (e) {
      ViewUtils.instance.showSnackBar(
        scaffoldMessenger,
        message: e.toString(),
        mode: SnackBarMode.failure,
      );
    }
  }
}
