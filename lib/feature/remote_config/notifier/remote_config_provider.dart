import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// remote configのprovider
final remoteConfigProvider = Provider<FirebaseRemoteConfig>(
  (ref) {
    // 古いバージョンだとFirebaseRemoteConfigではなく、RemoteConfigだった。
    final rc = FirebaseRemoteConfig.instance;
    // 本番環境
    // const interval = Duration(minutes: 12);
    // 開発
    const interval = Duration.zero;

    // タイムアウトとフェッチのインターバル時間を設定する
    rc.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: interval,
      ),
    );
    return rc;
  },
);
