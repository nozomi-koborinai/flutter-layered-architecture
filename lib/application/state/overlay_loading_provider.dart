import 'package:flutter_riverpod/flutter_riverpod.dart';

/// オーバーレイローディング制御フラグのプロバイダー
final overlayLoadingProvider = StateProvider(
  (_) => false,
);
