import 'package:flutter/material.dart';
import 'package:flutter_reference_app_2/presentation/view_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// プレゼンテーション層で共通エラーハンドリングを行う Mixin
mixin ErrorHandlerMixin {
  Future<void> execute(
    BuildContext context,
    WidgetRef ref, {
    required Future<void> Function() action,
    required String successMessage,
  }) async {
    final viewUtils = ref.watch(viewUtilsProvider);

    try {
      await action();
      viewUtils.showSnackBar(
        message: successMessage,
      );
    } catch (e) {
      viewUtils.showSnackBar(
        message: e.toString(),
        mode: SnackBarMode.failure,
      );
    }
  }
}
