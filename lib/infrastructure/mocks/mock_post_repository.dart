import 'package:flutter_layered_architecture/domain/post/entity/post.dart';
import 'package:flutter_layered_architecture/domain/post/post_repository.dart';

import '../../domain/user/entity/user.dart';

class MockPostRepository implements PostRepository {
  var mockPosts = <Post>[
    Post(
      id: "001",
      user: const User(
        id: "001",
        userName: "hoge",
        imageUrl:
            'https://1.bp.blogspot.com/-Ax7y4QVbj-c/X5OcVJn04jI/AAAAAAABb8g/aWzcFaud_V42uAc_3xPTisdrKCDeg_OvQCNcBGAsYHQ/s400/food_yukkejan.png',
      ),
      imageUrl:
          "https://1.bp.blogspot.com/-Ax7y4QVbj-c/X5OcVJn04jI/AAAAAAABb8g/aWzcFaud_V42uAc_3xPTisdrKCDeg_OvQCNcBGAsYHQ/s400/food_yukkejan.png",
      comment: "This is post 1",
      createdAt: DateTime.now().subtract(const Duration(days: 20)),
    ),
    Post(
      id: "002",
      user: const User(
        id: "001",
        userName: "hoge",
        imageUrl:
            'https://1.bp.blogspot.com/-Ax7y4QVbj-c/X5OcVJn04jI/AAAAAAABb8g/aWzcFaud_V42uAc_3xPTisdrKCDeg_OvQCNcBGAsYHQ/s400/food_yukkejan.png',
      ),
      imageUrl:
          "https://1.bp.blogspot.com/-Ax7y4QVbj-c/X5OcVJn04jI/AAAAAAABb8g/aWzcFaud_V42uAc_3xPTisdrKCDeg_OvQCNcBGAsYHQ/s400/food_yukkejan.png",
      comment: "This is post 2",
      createdAt: DateTime.now().subtract(const Duration(days: 19)),
    ),
    Post(
      id: "003",
      user: const User(
        id: "001",
        userName: "hoge",
        imageUrl:
            'https://1.bp.blogspot.com/-Ax7y4QVbj-c/X5OcVJn04jI/AAAAAAABb8g/aWzcFaud_V42uAc_3xPTisdrKCDeg_OvQCNcBGAsYHQ/s400/food_yukkejan.png',
      ),
      imageUrl:
          "https://1.bp.blogspot.com/-Ax7y4QVbj-c/X5OcVJn04jI/AAAAAAABb8g/aWzcFaud_V42uAc_3xPTisdrKCDeg_OvQCNcBGAsYHQ/s400/food_yukkejan.png",
      comment: "This is post 3",
      createdAt: DateTime.now().subtract(const Duration(days: 18)),
    ),
    Post(
      id: "004",
      user: const User(
        id: "001",
        userName: "hoge",
        imageUrl:
            'https://1.bp.blogspot.com/-Ax7y4QVbj-c/X5OcVJn04jI/AAAAAAABb8g/aWzcFaud_V42uAc_3xPTisdrKCDeg_OvQCNcBGAsYHQ/s400/food_yukkejan.png',
      ),
      imageUrl:
          "https://1.bp.blogspot.com/-Ax7y4QVbj-c/X5OcVJn04jI/AAAAAAABb8g/aWzcFaud_V42uAc_3xPTisdrKCDeg_OvQCNcBGAsYHQ/s400/food_yukkejan.png",
      comment: "This is post 4",
      createdAt: DateTime.now().subtract(const Duration(days: 17)),
    ),
    Post(
      id: "005",
      user: const User(
        id: "001",
        userName: "hoge",
        imageUrl:
            'https://1.bp.blogspot.com/-Ax7y4QVbj-c/X5OcVJn04jI/AAAAAAABb8g/aWzcFaud_V42uAc_3xPTisdrKCDeg_OvQCNcBGAsYHQ/s400/food_yukkejan.png',
      ),
      imageUrl:
          "https://1.bp.blogspot.com/-Ax7y4QVbj-c/X5OcVJn04jI/AAAAAAABb8g/aWzcFaud_V42uAc_3xPTisdrKCDeg_OvQCNcBGAsYHQ/s400/food_yukkejan.png",
      comment: "This is post 5",
      createdAt: DateTime.now().subtract(const Duration(days: 16)),
    ),
    Post(
      id: "006",
      user: const User(
        id: "001",
        userName: "hoge",
        imageUrl:
            'https://1.bp.blogspot.com/-Ax7y4QVbj-c/X5OcVJn04jI/AAAAAAABb8g/aWzcFaud_V42uAc_3xPTisdrKCDeg_OvQCNcBGAsYHQ/s400/food_yukkejan.png',
      ),
      imageUrl:
          "https://1.bp.blogspot.com/-Ax7y4QVbj-c/X5OcVJn04jI/AAAAAAABb8g/aWzcFaud_V42uAc_3xPTisdrKCDeg_OvQCNcBGAsYHQ/s400/food_yukkejan.png",
      comment: "This is post 6",
      createdAt: DateTime.now().subtract(const Duration(days: 15)),
    ),
    Post(
      id: "007",
      user: const User(
        id: "001",
        userName: "hoge",
        imageUrl:
            'https://1.bp.blogspot.com/-Ax7y4QVbj-c/X5OcVJn04jI/AAAAAAABb8g/aWzcFaud_V42uAc_3xPTisdrKCDeg_OvQCNcBGAsYHQ/s400/food_yukkejan.png',
      ),
      imageUrl:
          "https://1.bp.blogspot.com/-Ax7y4QVbj-c/X5OcVJn04jI/AAAAAAABb8g/aWzcFaud_V42uAc_3xPTisdrKCDeg_OvQCNcBGAsYHQ/s400/food_yukkejan.png",
      comment: "This is post 7",
      createdAt: DateTime.now().subtract(const Duration(days: 14)),
    ),
    Post(
      id: "008",
      user: const User(
        id: "001",
        userName: "hoge",
        imageUrl:
            'https://1.bp.blogspot.com/-Ax7y4QVbj-c/X5OcVJn04jI/AAAAAAABb8g/aWzcFaud_V42uAc_3xPTisdrKCDeg_OvQCNcBGAsYHQ/s400/food_yukkejan.png',
      ),
      imageUrl:
          "https://1.bp.blogspot.com/-Ax7y4QVbj-c/X5OcVJn04jI/AAAAAAABb8g/aWzcFaud_V42uAc_3xPTisdrKCDeg_OvQCNcBGAsYHQ/s400/food_yukkejan.png",
      comment: "This is post 8",
      createdAt: DateTime.now().subtract(const Duration(days: 13)),
    ),
  ];

  @override
  Future<void> add({required Post post}) async {
    await Future.delayed(const Duration(seconds: 2));
    mockPosts.add(post);
  }

  @override
  Future<void> delete({required String postId}) async {
    await Future.delayed(const Duration(seconds: 2));
    mockPosts.removeWhere((post) => post.id == postId);
  }

  @override
  Future<Post> fetch({required String postId}) async {
    await Future.delayed(const Duration(seconds: 2));
    return mockPosts.where((post) => post.id == postId).first;
  }

  @override
  Future<List<Post>> fetchAll() async {
    await Future.delayed(const Duration(seconds: 2));
    return mockPosts;
  }

  @override
  Future<void> update({required Post post}) async {
    await Future.delayed(const Duration(seconds: 2));
    post = post.copyWith(
        imageUrl:
            'https://1.bp.blogspot.com/-rb5mSYSN8pA/X6tmegQM2ZI/AAAAAAABcLw/_-n5UvfxhJItVJnKRrycKPShVDsxStrjACNcBGAsYHQ/s400/fruit_apple_yellow.png');
    var index =
        mockPosts.indexWhere((existingPost) => existingPost.id == post.id);
    if (index == -1) return;
    mockPosts[index] = post;
  }
}
