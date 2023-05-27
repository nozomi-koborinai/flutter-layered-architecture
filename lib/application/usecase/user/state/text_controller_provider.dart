import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Signin Email アドレス入力用のテキストコントローラープロバイダー
final signinEmailControllerProvider =
    StateProvider.autoDispose<TextEditingController>(
  (_) => TextEditingController(),
);

/// Signin Password 入力用のテキストコントローラープロバイダー
final signinPasswordControllerProvider =
    StateProvider.autoDispose<TextEditingController>(
  (_) => TextEditingController(),
);

/// Signup Email アドレス入力用のテキストコントローラープロバイダー
final signupEmailControllerProvider =
    StateProvider.autoDispose<TextEditingController>(
  (_) => TextEditingController(),
);

/// Signup Password 入力用のテキストコントローラープロバイダー
final signUpPasswordControllerProvider =
    StateProvider.autoDispose<TextEditingController>(
  (_) => TextEditingController(),
);
