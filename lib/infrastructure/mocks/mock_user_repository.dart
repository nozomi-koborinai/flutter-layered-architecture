import 'dart:async';

import 'package:flutter_layered_architecture/domain/user/entity/user.dart';
import 'package:flutter_layered_architecture/domain/user/user_repository.dart';

import '../../domain/app_exception.dart';

class MockUserRepository implements UserRepository {
  final mockUserId = 'mockuser000';
  final mockUserName = 'Mock User';
  final mockUserImageUrl =
      'https://1.bp.blogspot.com/-_JwCwOPPE1s/X9GYHH3CirI/AAAAAAABctM/RpxqJYP7syENbaaWyNIfhi2SsLGeNaEQgCNcBGAsYHQ/s400/food_sushi_kobore_ikura_don.png';

  @override
  Future<User> signIn({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
    if (email != 'test@example.com' || password != 'test') {
      throw const AppException('メールアドレス または パスワードが異なります');
    }
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
    if (!email.contains('@')) {
      throw const AppException('メールアドレスの形式が不正です');
    }
    return mockUserId;
  }

  @override
  Future<User> register({required User user}) async {
    await Future.delayed(const Duration(seconds: 2));
    return User(
      id: user.id,
      userName: user.userName,
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
      userName: '${mockUserName}2',
      imageUrl:
          'https://1.bp.blogspot.com/-Ax7y4QVbj-c/X5OcVJn04jI/AAAAAAABb8g/aWzcFaud_V42uAc_3xPTisdrKCDeg_OvQCNcBGAsYHQ/s400/food_yukkejan.png',
    );
  }
}
