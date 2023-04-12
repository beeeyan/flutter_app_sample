import 'package:flutter/material.dart';
import 'package:flutter_app_sample/feature/ad_mob/notifier/ad_mob_provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdBanner extends ConsumerWidget {
  const AdBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final banner = ref.watch(adMobNotifierProvider);

    return SizedBox(
      height: 50,
      width: double.infinity,
      child: banner == null
          ? Container()
          : AdWidget(
              ad: banner,
            ),
    );
  }
}
