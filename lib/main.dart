import 'package:flutter/material.dart';
import 'package:flutter_layered_architecture/domain/post/post_repository.dart';
import 'package:flutter_layered_architecture/domain/service/storage_service.dart';
import 'package:flutter_layered_architecture/domain/user/user_repository.dart';
import 'package:flutter_layered_architecture/infrastructure/mocks/mock_post_repository.dart';
import 'package:flutter_layered_architecture/infrastructure/mocks/mock_storage_service.dart';
import 'package:flutter_layered_architecture/presentation/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'infrastructure/mocks/mock_user_repository.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        userRepositoryProvider.overrideWithValue(MockUserRepository()),
        postRepositoryProvider.overrideWithValue(MockPostRepository()),
        storageServiceProvider.overrideWithValue(MockStorageService()),
      ],
      child: const App(),
    ),
  );
}
