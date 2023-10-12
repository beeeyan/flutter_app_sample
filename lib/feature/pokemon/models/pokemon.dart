import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

// 一部参考
// https://zenn.dev/sugitlab/books/flutter_poke_app_handson/viewer/step8

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({
    /// id
    required int id,

    /// 名前
    required String name,

    /// 説明
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);
}
