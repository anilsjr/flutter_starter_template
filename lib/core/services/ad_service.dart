import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../utils/logger.dart';

class AdService {
  static BannerAd? _bannerAd;

  static void loadBannerAd(String adUnitId) {
    if (kIsWeb) {
      AppLogger.w('Ads are not supported on Web');
      return;
    }
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) => AppLogger.d('Banner Ad Loaded'),
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          AppLogger.e('Banner Ad Failed to Load: $error');
        },
      ),
    )..load();
  }

  static BannerAd? get bannerAd => _bannerAd;

  static void dispose() {
    _bannerAd?.dispose();
  }
}
