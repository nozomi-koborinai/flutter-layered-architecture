import 'package:flutter/material.dart';
import 'package:flutter_reference_app_2/domain/user/user_repository.dart';
import 'package:flutter_reference_app_2/presentation/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'infrastructure/mocks/mock_user_repository.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        userRepositoryProvider.overrideWithValue(MockUserRepository()),
      ],
      child: const App(),
    ),
  );
}
