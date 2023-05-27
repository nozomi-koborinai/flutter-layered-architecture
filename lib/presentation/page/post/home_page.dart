import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ボトムバー選択中インデックスプロバイダー
final currentIndexProvider = StateProvider<int>((_) => IndexMode.list.index);

/// インデックスモード
enum IndexMode {
  /// 投稿一覧
  list,

  /// プロフィール
  profile,
}

/// ホームページ
class HomePage extends ConsumerWidget {
  final List<Widget> _children = [
    const MockWidget(Colors.green),
    const MockWidget(Colors.blue),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(currentIndexProvider);
    return Scaffold(
      body: _children[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) =>
            ref.watch(currentIndexProvider.notifier).state = index,
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}

/// それぞれのページが完成するまでの仮ウィジェット
class MockWidget extends StatelessWidget {
  final Color color;

  const MockWidget(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
