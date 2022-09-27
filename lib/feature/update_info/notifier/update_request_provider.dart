import 'dart:convert';

import 'package:flutter_app_sample/enum/update_request_type.dart';
import 'package:flutter_app_sample/feature/remote_config/notifier/remote_config_provider.dart';
import 'package:flutter_app_sample/feature/update_info/model/update_info.dart';
import 'package:flutter_app_sample/util/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart';

// せめて「autoDispose」がついていた方が即時反映ができる気がする。
final updateRequesterProvider =
    FutureProvider.autoDispose<UpdateRequestType>((ref) async {
  // 初期化・アクティブベート済みのRemoteConfigインスタンス
  final remoteConfig = ref.watch(remoteConfigProvider);
  await remoteConfig.fetchAndActivate();
  // FirebaseのRemoteConfigコンソールで指定したキーを使って値を取得
  final string = remoteConfig.getString('update_info');
  if (string.isEmpty) {
    return UpdateRequestType.not;
  }
  // JSON to Map
  final map = json.decode(string) as Map<String, Object?>;
  // Mao(Json) to Model
  final updateInfo = UpdateInfo.fromJson(map);

  // 現在のアプリケーションを取得
  final appPackageInfo = await PackageInfo.fromPlatform();

  final enabledAt = updateInfo.enabledAt;
  final requiredVersion = Version.parse(updateInfo.requiredVersion);
  final currentVersion = Version.parse(appPackageInfo.version);

  logger
    ..i('Remote Configから取得したバージョン : ${updateInfo.requiredVersion}')
    ..i('端末内のアプリのバージョン : ${appPackageInfo.version}');

  // 現在のバージョンより新しいバージョンが指定されているか
  final hasNewVersion = requiredVersion > currentVersion;
  // 強制アップデート有効期限内かどうか
  final isEnabled = enabledAt.compareTo(DateTime.now()) < 0;

  if (!isEnabled || !hasNewVersion) {
    // 有効期限外、もしくは新しいバージョンが無い
    return UpdateRequestType.not;
  }
  return updateInfo.canCancel
      ? UpdateRequestType.cancelable
      : UpdateRequestType.forcibly;
});
