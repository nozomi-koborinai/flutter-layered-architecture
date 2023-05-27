import 'dart:async';

import 'package:flutter_reference_app_2/domain/user/entity/user.dart';
import 'package:flutter_reference_app_2/domain/user/user_repository.dart';

class MockUserRepository implements UserRepository {
  final mockUserId = 'mockuser000';
  final mockUserName = 'Mock User';
  final mockUserImageUrl =
      'https://1.bp.blogspot.com/-_JwCwOPPE1s/X9GYHH3CirI/AAAAAAABctM/RpxqJYP7syENbaaWyNIfhi2SsLGeNaEQgCNcBGAsYHQ/s400/food_sushi_kobore_ikura_don.png';

  @override
  Future<User> signIn({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
    return User(
      id: mockUserId,
      userName: mockUserName,
      imageUrl: mockUserImageUrl,
    );
  }

  @override
  Future<String> signUp(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
    return mockUserId;
  }

  @override
  Future<User> register({required User user}) async {
    await Future.delayed(const Duration(seconds: 2));
    return User(
      id: mockUserId,
      userName: mockUserName,
      imageUrl: mockUserImageUrl,
    );
  }

  @override
  Future<void> delete({required String uid}) async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<User> fetch({required String uid}) async {
    await Future.delayed(const Duration(seconds: 2));
    return User(
      id: uid,
      userName: 'Mock User',
      imageUrl: 'https://example.com/mockuser.jpg',
    );
  }
}
