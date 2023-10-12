import 'package:flutter/material.dart';
import 'package:flutter_app_sample/feature/ad_mob/notifier/ad_mob_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigatorObserverProvider = Provider.autoDispose<NavigatorObserver>(
  (ref) => MyNavigatorObserver(
    ref.watch(adMobNotifierProvider.notifier),
  ),
);

class MyNavigatorObserver extends NavigatorObserver {
  MyNavigatorObserver(this.adMobController);

  final AdMobNotifier adMobController;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);

    // pushしたときは「previousRoute」から「route」に遷移する
    // よって「previousRoute」が広告表示の画面ときに広告を破棄する。
    if (previousRoute?.settings.name == '/') {
      adMobController.disposeAd();
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);

    // popしたときは「route」から「previousRoute」に遷移する
    // よって「previousRoute」が広告表示の画面のときに広告をロードする。
    if (previousRoute?.settings.name == '/') {
      adMobController.createBannerAd();
    }
  }
}
