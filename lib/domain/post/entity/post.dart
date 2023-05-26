import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user/entity/user.dart';

part 'post.freezed.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String? id,
    required User user,
    required String imageUrl,
    required String comment,
    required DateTime? createdAt,
  }) = _Post;
}
