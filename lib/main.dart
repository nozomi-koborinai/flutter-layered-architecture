import 'package:flutter/material.dart';
import 'package:flutter_reference_app_2/presentation/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
