import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item{

  const factory Item({
    /// id
    required int id,

    /// 名前
    required String name,

    /// 説明
    required String description,

    /// 説明
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
