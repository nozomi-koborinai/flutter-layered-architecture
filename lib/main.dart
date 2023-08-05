import 'package:flutter/material.dart';
import 'package:flutter_layered_architecture/domain/post/post_repository.dart';
import 'package:flutter_layered_architecture/domain/service/storage_service.dart';
import 'package:flutter_layered_architecture/domain/user/user_repository.dart';
import 'package:flutter_layered_architecture/infrastructure/mocks/mock_post_repository.dart';
import 'package:flutter_layered_architecture/infrastructure/mocks/mock_storage_service.dart';
import 'package:flutter_layered_architecture/infrastructure/remote/graph_ql_post_repository.dart';
import 'package:flutter_layered_architecture/infrastructure/remote/graph_ql_storage_service.dart';
import 'package:flutter_layered_architecture/infrastructure/remote/graph_ql_user_repository.dart';
import 'package:flutter_layered_architecture/presentation/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'infrastructure/mocks/mock_user_repository.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        userRepositoryProvider.overrideWithValue(
            Flavor.isDemo ? MockUserRepository() : GraphQlUserRepository()),
        postRepositoryProvider.overrideWithValue(
            Flavor.isDemo ? MockPostRepository() : GraphQlPostRepository()),
        storageServiceProvider.overrideWithValue(
            Flavor.isDemo ? MockStorageService() : GraphQlStorageService()),
      ],
      child: const App(),
    ),
  );
}

/// ビルド時の引数を参照したサーバー環境切り替え用のenum
enum Flavor {
  demo,
  // FIXME(masaki): リモート環境追加後に状況に合わせて随時修正&追加
  dev;

  static Flavor get fromEnvironment {
    const flavorStr = String.fromEnvironment('flavor');
    return Flavor.values.byName(flavorStr);
  }

  static bool get isDemo => fromEnvironment == demo;
}
