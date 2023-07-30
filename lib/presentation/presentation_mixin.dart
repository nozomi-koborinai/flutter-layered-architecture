import 'package:flutter/material.dart';
import 'package:flutter_layered_architecture/domain/app_exception.dart';
import 'package:flutter_layered_architecture/presentation/component/failure_snackbar.dart';
import 'package:flutter_layered_architecture/presentation/component/success_snackbar.dart';

/// プレゼンテーション層用のエラーハンドリングをラップした共通処理 Mixin
mixin PresentationMixin {
  Future<void> execute(
    BuildContext context, {
    required Future<void> Function() action,
    required String successMessage,
  }) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      await action();
      SuccessSnackBar.show(
        scaffoldMessenger,
        message: successMessage,
      );
    } on AppException catch (e) {
      FailureSnackBar.show(
        scaffoldMessenger,
        message: e.toString(),
      );
    }
  }
}
