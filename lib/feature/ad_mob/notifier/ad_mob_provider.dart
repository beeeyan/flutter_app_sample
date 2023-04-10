import 'dart:io';

import 'package:flutter_app_sample/util/logger.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final adMobNotifierProvider =
    StateNotifierProvider.autoDispose<AdMobController, BannerAd?>(
  (ref) => AdMobController(
    iosAdId: 'ca-app-pub-3940256099942544/2934735716',
    androidAdId: 'ca-app-pub-3940256099942544/6300978111',
  ),
);

class AdMobController extends StateNotifier<BannerAd?> {
  AdMobController({required this.iosAdId, required this.androidAdId})
      : super(null) {
    createBannerAd();
  }

  final String iosAdId;
  final String androidAdId;

  String getBannerAdUnitId() {
    var adId = '';
    // iOSとAndroidで広告ユニットIDを分岐させる
    if (Platform.isIOS) {
      // iOSの広告ユニットID
      adId = iosAdId;
    } else if (Platform.isAndroid) {
      // Androidの広告ユニットID
      adId = androidAdId;
    }
    return adId;
  }

  BannerAdListener get adListener => _adListener;

  final _adListener = BannerAdListener(
    onAdLoaded: (ad) => logger.i('Ad loaded: ${ad.adUnitId}.'),
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      logger.e('Ad failed to load: ${ad.adUnitId}, $error.');
    },
    onAdOpened: (ad) => logger.i('Ad opened: ${ad.adUnitId}.'),
    onAdClosed: (ad) => logger.i('Ad closed: ${ad.adUnitId}.'),
    onAdWillDismissScreen: (ad) =>
        logger.i('Ad will dismiss screen: ${ad.adUnitId}.'),
    onAdImpression: (ad) => logger.i('Ad impression: ${ad.adUnitId}.'),
    onPaidEvent: (ad, valueMicros, precision, currencyCode) =>
        logger.i('paid event: ${ad.adUnitId},'
            ' value micros $valueMicros'
            ' precision $precision'
            ' currency code $currencyCode'),
  );

  void createBannerAd() {
    if (mounted) {
      state = BannerAd(
        listener: _adListener,
        size: AdSize.banner,
        adUnitId: getBannerAdUnitId(),
        request: const AdRequest(),
      )..load();
    }
  }

  void disposeAd() {
    if (mounted) {
      state?.dispose();
      state = null;
    }
  }
}
