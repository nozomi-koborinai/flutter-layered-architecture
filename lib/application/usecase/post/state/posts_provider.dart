import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/post/entity/post.dart';
import '../post_usecase.dart';

/// 全投稿を保持するプロバイダー
final postsProvider = FutureProvider.autoDispose<List<Post>>(
  (ref) async => ref.watch(postUsecaseProvider).fetchAllPosts(),
);
