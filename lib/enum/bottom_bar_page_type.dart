import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../feature/pokemon/presentation/pokemon_view.dart';
import '../field_sample_list.dart';
import '../my_home.dart';
import '../sample_list.dart';
import '../voice_controll.dart';

/// サンプルは基本追加とする。
/// ボトムナビゲーションの数は3か4におさえ、直近見なくていいものはコメントアウトする。
final bottomBarPageTypeProvider =
    StateProvider<BottomBarPageType>((ref) => BottomBarPageType.home);

enum BottomBarPageType {
  home(
    'ホーム',
    Icon(Icons.home),
    // ForcedUpgradePage(),
    MyHomePage(),
  ),
  // secondPage(
  //   'ポケモン',
  //   Icon(Icons.bookmark_outlined),
  //   PokemonViewPage(),
  // ),
  thirdPage(
    'サンプルへの遷移',
    Icon(Icons.playlist_add_check),
    SampleListPage(),
  ),
  fourthPage(
    'フィールドのサイズ変更サンプル',
    Icon(Icons.bookmark_outlined),
    FieldSampleList(),
  ),
  fifthPage(
    '音声コントロール',
    Icon(Icons.mic),
    VoiceControl(),
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
