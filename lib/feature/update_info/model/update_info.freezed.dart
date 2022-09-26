// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateInfo _$UpdateInfoFromJson(Map<String, dynamic> json) {
  return _UpdateInfo.fromJson(json);
}

/// @nodoc
mixin _$UpdateInfo {
  /// 要求バージョン e.g., '1.0.0'
  String get requiredVersion => throw _privateConstructorUsedError;

  /// アップデートを後回し可能にするかどうか
  bool get canCancel => throw _privateConstructorUsedError;

  /// 有効日（この日時以降のみ有効とする）
  DateTime get enabledAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateInfoCopyWith<UpdateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateInfoCopyWith<$Res> {
  factory $UpdateInfoCopyWith(
          UpdateInfo value, $Res Function(UpdateInfo) then) =
      _$UpdateInfoCopyWithImpl<$Res>;
  $Res call({String requiredVersion, bool canCancel, DateTime enabledAt});
}

/// @nodoc
class _$UpdateInfoCopyWithImpl<$Res> implements $UpdateInfoCopyWith<$Res> {
  _$UpdateInfoCopyWithImpl(this._value, this._then);

  final UpdateInfo _value;
  // ignore: unused_field
  final $Res Function(UpdateInfo) _then;

  @override
  $Res call({
    Object? requiredVersion = freezed,
    Object? canCancel = freezed,
    Object? enabledAt = freezed,
  }) {
    return _then(_value.copyWith(
      requiredVersion: requiredVersion == freezed
          ? _value.requiredVersion
          : requiredVersion // ignore: cast_nullable_to_non_nullable
              as String,
      canCancel: canCancel == freezed
          ? _value.canCancel
          : canCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      enabledAt: enabledAt == freezed
          ? _value.enabledAt
          : enabledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_UpdateInfoCopyWith<$Res>
    implements $UpdateInfoCopyWith<$Res> {
  factory _$$_UpdateInfoCopyWith(
          _$_UpdateInfo value, $Res Function(_$_UpdateInfo) then) =
      __$$_UpdateInfoCopyWithImpl<$Res>;
  @override
  $Res call({String requiredVersion, bool canCancel, DateTime enabledAt});
}

/// @nodoc
class __$$_UpdateInfoCopyWithImpl<$Res> extends _$UpdateInfoCopyWithImpl<$Res>
    implements _$$_UpdateInfoCopyWith<$Res> {
  __$$_UpdateInfoCopyWithImpl(
      _$_UpdateInfo _value, $Res Function(_$_UpdateInfo) _then)
      : super(_value, (v) => _then(v as _$_UpdateInfo));

  @override
  _$_UpdateInfo get _value => super._value as _$_UpdateInfo;

  @override
  $Res call({
    Object? requiredVersion = freezed,
    Object? canCancel = freezed,
    Object? enabledAt = freezed,
  }) {
    return _then(_$_UpdateInfo(
      requiredVersion: requiredVersion == freezed
          ? _value.requiredVersion
          : requiredVersion // ignore: cast_nullable_to_non_nullable
              as String,
      canCancel: canCancel == freezed
          ? _value.canCancel
          : canCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      enabledAt: enabledAt == freezed
          ? _value.enabledAt
          : enabledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateInfo implements _UpdateInfo {
  const _$_UpdateInfo(
      {required this.requiredVersion,
      this.canCancel = false,
      required this.enabledAt});

  factory _$_UpdateInfo.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateInfoFromJson(json);

  /// 要求バージョン e.g., '1.0.0'
  @override
  final String requiredVersion;

  /// アップデートを後回し可能にするかどうか
  @override
  @JsonKey()
  final bool canCancel;

  /// 有効日（この日時以降のみ有効とする）
  @override
  final DateTime enabledAt;

  @override
  String toString() {
    return 'UpdateInfo(requiredVersion: $requiredVersion, canCancel: $canCancel, enabledAt: $enabledAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateInfo &&
            const DeepCollectionEquality()
                .equals(other.requiredVersion, requiredVersion) &&
            const DeepCollectionEquality().equals(other.canCancel, canCancel) &&
            const DeepCollectionEquality().equals(other.enabledAt, enabledAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(requiredVersion),
      const DeepCollectionEquality().hash(canCancel),
      const DeepCollectionEquality().hash(enabledAt));

  @JsonKey(ignore: true)
  @override
  _$$_UpdateInfoCopyWith<_$_UpdateInfo> get copyWith =>
      __$$_UpdateInfoCopyWithImpl<_$_UpdateInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateInfoToJson(
      this,
    );
  }
}

abstract class _UpdateInfo implements UpdateInfo {
  const factory _UpdateInfo(
      {required final String requiredVersion,
      final bool canCancel,
      required final DateTime enabledAt}) = _$_UpdateInfo;

  factory _UpdateInfo.fromJson(Map<String, dynamic> json) =
      _$_UpdateInfo.fromJson;

  @override

  /// 要求バージョン e.g., '1.0.0'
  String get requiredVersion;
  @override

  /// アップデートを後回し可能にするかどうか
  bool get canCancel;
  @override

  /// 有効日（この日時以降のみ有効とする）
  DateTime get enabledAt;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateInfoCopyWith<_$_UpdateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
