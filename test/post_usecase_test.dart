import 'package:flutter_layered_architecture/application/usecase/post/post_usecase.dart';
import 'package:flutter_layered_architecture/domain/post/post_repository.dart';
import 'package:flutter_layered_architecture/domain/service/storage_service.dart';
import 'package:flutter_layered_architecture/infrastructure/mocks/mock_post_repository.dart';
import 'package:flutter_layered_architecture/infrastructure/mocks/mock_storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final ProviderContainer container;
  late final MockPostRepository repository;

  setUp(() {
    container = ProviderContainer(
      overrides: [
        postRepositoryProvider.overrideWithValue(MockPostRepository()),
        storageServiceProvider.overrideWithValue(MockStorageService()),
      ],
    );
    // TODO(masaki): 不要であれば削除
    repository = container.read(postRepositoryProvider) as MockPostRepository;
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

// TODO(masaki): add postもやってpost_usecase_testに全体にするか検討
//   group('addPost', () {
//     test('投稿が追加されている', () async {
//       final usecase = container.read(postUsecaseProvider);
//       final result = await usecase.addPost(
//         title: 'test title',
//         body: 'test body',
//       );
//
//       final sortedPosts = repository.mockPosts
//         ..sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
//
//       expect(result, sortedPosts);
//     });
//   });
}
