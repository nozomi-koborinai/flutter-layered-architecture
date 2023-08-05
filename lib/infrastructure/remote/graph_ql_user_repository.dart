import 'package:flutter_layered_architecture/domain/user/entity/user.dart';
import 'package:flutter_layered_architecture/domain/user/user_repository.dart';

class GraphQlUserRepository implements UserRepository {
  @override
  Future<void> delete({required String uid}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<User> fetch({required String uid}) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<User> register({required User user}) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<User> signIn({required String email, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<String> signUp({required String email, required String password}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
