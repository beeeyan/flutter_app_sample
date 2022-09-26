import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_info.freezed.dart';
part 'update_info.g.dart';

@freezed
class UpdateInfo with _$UpdateInfo {
  const factory UpdateInfo({

    /// 要求バージョン e.g., '1.0.0'
    required String requiredVersion,

    /// アップデートを後回し可能にするかどうか
    @Default(false) bool canCancel,

    /// 有効日（この日時以降のみ有効とする）
    required DateTime enabledAt,
  }) = _UpdateInfo;

  factory UpdateInfo.fromJson(Map<String, dynamic> json) =>
      _$UpdateInfoFromJson(json);
}