import 'package:flutter/material.dart';
import 'package:flutter_app_sample/feature/drop_down/presentation/drop_down_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../feature/pokemon/presentation/pokemon_view.dart';
import '../my_home.dart';

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
    'ポケモン',
    Icon(Icons.bookmark_outlined),
    PokemonViewPage(),
  ),
  thirdPage(
    'プルダウン',
    Icon(Icons.playlist_add_check),
    DropdownPage(),
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
