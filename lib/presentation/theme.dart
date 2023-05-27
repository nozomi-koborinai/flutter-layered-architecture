import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// テーマプロバイダー
final themeProvider = Provider(
  (ref) {
    return ThemeData(
      useMaterial3: true,
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.grey[700]),
          bodyMedium: TextStyle(color: Colors.grey[700]),
          bodySmall: TextStyle(color: Colors.grey[700])),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.grey[700],
          fontSize: 22,
        ),
        iconTheme: IconThemeData(
          color: Colors.grey[700],
        ),
      ),
    );
  },
);
