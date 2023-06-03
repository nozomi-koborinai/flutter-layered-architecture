import 'package:flutter/material.dart';
import 'package:flutter_reference_app_2/domain/post/entity/post.dart';
import 'package:flutter_reference_app_2/domain/user/entity/user.dart';
import 'package:flutter_reference_app_2/presentation/page/post/component/post_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DI した テスト用の投稿データが表示されるはず', (WidgetTester tester) async {
    // テスト用の投稿データ
    final post = Post(
      id: 'mock_post',
      user: const User(
        id: 'mock_user',
        userName: 'Mock User',
        imageUrl:
            'https://1.bp.blogspot.com/-Ax7y4QVbj-c/X5OcVJn04jI/AAAAAAABb8g/aWzcFaud_V42uAc_3xPTisdrKCDeg_OvQCNcBGAsYHQ/s400/food_yukkejan.png',
      ),
      imageUrl:
          'https://1.bp.blogspot.com/-Ax7y4QVbj-c/X5OcVJn04jI/AAAAAAABb8g/aWzcFaud_V42uAc_3xPTisdrKCDeg_OvQCNcBGAsYHQ/s400/food_yukkejan.png',
      comment: 'Mock Comment',
      createdAt: DateTime.now(),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PostItem(post: post),
        ),
      ),
    );

    expect(find.text('Mock User'), findsOneWidget);
    expect(find.text('Mock Comment'), findsOneWidget);
  });
}
