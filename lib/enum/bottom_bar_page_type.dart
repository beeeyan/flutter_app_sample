import 'package:flutter/material.dart';
import 'package:flutter_app_sample/speech_to_text_action.dart';
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
    '音声コントロール確認',
    Icon(Icons.mic),
    VoiceControl(),
  ),
  sixthPage(
    '音声認識で画面遷移',
    Icon(Icons.mic),
    SpeechToTextAction(),
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
