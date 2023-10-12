import 'package:flutter/material.dart';
import 'package:flutter_app_sample/presentation/page/forced_upgrade.dart';
import 'package:flutter_app_sample/presentation/page/my_home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bottomBarPageTypeProvider =
    StateProvider<BottomBarPageType>((ref) => BottomBarPageType.home);

enum BottomBarPageType {
  home(
    'ホーム',
    Icon(Icons.home),
    // ForcedUpgradePage(),
    MyHomePage(),
  ),
  secondPage(
    '別ページ',
    Icon(Icons.bookmark_outlined),
    Center(
      child: Text('普通'),
    ),
  );

  const BottomBarPageType(
    this.title,
    this.buttonIcon,
    this.widget,
  );

  final String title;
  final Icon buttonIcon;
  final Widget widget;
}
