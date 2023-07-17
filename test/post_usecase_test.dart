import 'dart:io';

import 'package:flutter_layered_architecture/application/usecase/post/post_usecase.dart';
import 'package:flutter_layered_architecture/domain/post/post_repository.dart';
import 'package:flutter_layered_architecture/domain/service/storage_service.dart';
import 'package:flutter_layered_architecture/domain/user/entity/user.dart';
import 'package:flutter_layered_architecture/infrastructure/mocks/mock_post_repository.dart';
import 'package:flutter_layered_architecture/infrastructure/mocks/mock_storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer(
      overrides: [
        postRepositoryProvider.overrideWithValue(MockPostRepository()),
        storageServiceProvider.overrideWithValue(MockStorageService()),
      ],
    );
  });

  /// fetchAll用テスト
  group('fetchAll', () {
    /// 投稿が作成日時順に並んでいるかどうかをテストする
    /// モックデータが想定通りに並んでいるのかをidを使って確認する
    test('投稿が作成日時順に並んでいる', () async {
      final usecase = container.read(postUsecaseProvider);
      final result = await usecase.fetchAll();

      expect(result[0].id, '008');
      expect(result[1].id, '007');
      expect(result[2].id, '006');
      expect(result[3].id, '005');
      expect(result[4].id, '004');
      expect(result[5].id, '003');
      expect(result[6].id, '002');
      expect(result[7].id, '001');
    });
  });

  /// addPost用テスト
  group('addPost', () {
    test('画像がnullの場合は投稿されない', () async {
      final repository =
          container.read(postRepositoryProvider) as MockPostRepository;
      final usecase = container.read(postUsecaseProvider);

      // まず追加前の投稿件数を確認
      expect(repository.mockPosts.length, 8);

      await usecase.addPost(
          image: null,
          comment: '',
          user: const User(id: '', userName: '', imageUrl: ''));

      // 追加後の投稿件数を確認
      // 何も追加されていないはず
      expect(repository.mockPosts.length, 8);
    });

    test('ユーザーがnullの場合は投稿されない', () async {
      final repository =
          container.read(postRepositoryProvider) as MockPostRepository;
      final usecase = container.read(postUsecaseProvider);

      // まず追加前の投稿件数を確認
      expect(repository.mockPosts.length, 8);

      await usecase.addPost(image: File(''), comment: '', user: null);

      // 追加後の投稿件数を確認
      // 何も追加されていないはず
      expect(repository.mockPosts.length, 8);
    });

    test('投稿が追加されている', () async {
      final repository =
          container.read(postRepositoryProvider) as MockPostRepository;
      final usecase = container.read(postUsecaseProvider);

      // まず追加前の投稿件数を確認
      expect(repository.mockPosts.length, 8);

      await usecase.addPost(
          image: File(''),
          comment: '',
          user: const User(id: '', userName: '', imageUrl: ''));

      // 追加後の投稿件数を確認
      // + 1 されているはず
      expect(repository.mockPosts.length, 9);
    });
  });
}
