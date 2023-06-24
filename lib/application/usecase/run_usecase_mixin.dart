import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ユースケース実行のためのメソッドを備えた Mixin
mixin RunUsecaseMixin {
  Future<T> execute<T>(
    StateController<bool> loadingController,
    Future<T> Function() action,
  ) async {
    loadingController.update((_) => true);
    try {
      return await action();
    } catch (e) {
      rethrow;
    } finally {
      loadingController.update((_) => false);
    }
  }
}
