import 'package:flutter_layered_architecture/domain/post/entity/post.dart';
import 'package:flutter_layered_architecture/domain/post/post_repository.dart';

class GraphQlPostRepository implements PostRepository {
  @override
  Future<void> add({required Post post}) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<void> delete({required String postId}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Post> fetch({required String postId}) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> fetchAll() {
    // TODO: implement fetchAll
    throw UnimplementedError();
  }

  @override
  Future<void> update({required Post post}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
