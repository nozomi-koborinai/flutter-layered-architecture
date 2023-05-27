import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'component/failure_snackbar.dart';
import 'component/scaffold_messenger.dart';
import 'component/success_snackbar.dart';

/// View に関する Utilityメソッド群 プロバイダー
final viewUtilsProvider = Provider<ViewUtils>(ViewUtils.new);

/// Viewに関するUtilityメソッド群
class ViewUtils {
  const ViewUtils(this.ref);
  final Ref ref;

  /// スナックバー表示
  void showSnackBar({
    required String message,
    SnackBarMode mode = SnackBarMode.success,
  }) {
    final scaffoldMessengerState =
        ref.watch(scaffoldMessengerKeyProvider).currentState;
    if (scaffoldMessengerState == null) return;

    final snackBar = mode == SnackBarMode.success
        ? SuccessSnackBar(message: message)
        : FailureSnackBar(message: message);
    scaffoldMessengerState.showSnackBar(snackBar);
  }
}

/// スナックバー表示モード
enum SnackBarMode {
  /// 成功
  success,

  /// 失敗
  failure,
}
