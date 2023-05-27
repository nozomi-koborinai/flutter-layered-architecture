import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Email アドレス入力用のテキストコントローラープロバイダー
final emailControllerProvider =
    StateProvider.autoDispose<TextEditingController>(
  (_) => TextEditingController(),
);

/// Password 入力用のテキストコントローラープロバイダー
final passwordControllerProvider =
    StateProvider.autoDispose<TextEditingController>(
  (_) => TextEditingController(),
);
