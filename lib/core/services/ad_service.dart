import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../utils/logger.dart';

class AdService {
  static BannerAd? _bannerAd;
  static AppOpenAd? _appOpenAd;
  static bool _isShowingAd = false;

  /// Maximum duration allowed since an ad was loaded to be considered recent.
  static const Duration maxCacheDuration = Duration(hours: 4);

  /// Keep track of when an ad loaded to check for expiration.
  static DateTime? _appOpenLoadTime;

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

  static void loadAppOpenAd(String adUnitId) {
    if (kIsWeb) return;

    AppOpenAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          AppLogger.d('App Open Ad Loaded');
          _appOpenLoadTime = DateTime.now();
          _appOpenAd = ad;
        },
        onAdFailedToLoad: (error) {
          AppLogger.e('App Open Ad Failed to Load: $error');
        },
      ),
    );
  }

  static bool get isAppOpenAdAvailable {
    return _appOpenAd != null &&
        _appOpenLoadTime != null &&
        DateTime.now().subtract(maxCacheDuration).isBefore(_appOpenLoadTime!);
  }

  static void showAppOpenAdIfAvailable() {
    if (kIsWeb) return;
    if (_isShowingAd) {
      AppLogger.d('App Open Ad is already showing.');
      return;
    }
    if (!isAppOpenAdAvailable) {
      AppLogger.d('App Open Ad is not available.');
      // You might want to load a new one here if you're not using a reactor
      return;
    }

    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
        AppLogger.d('App Open Ad Showed');
      },
      onAdDismissedFullScreenContent: (ad) {
        _isShowingAd = false;
        AppLogger.d('App Open Ad Dismissed');
        ad.dispose();
        _appOpenAd = null;
        // Optionally load a new one
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        _isShowingAd = false;
        AppLogger.e('App Open Ad Failed to Show: $error');
        ad.dispose();
        _appOpenAd = null;
      },
    );

    _appOpenAd!.show();
  }

  static BannerAd? get bannerAd => _bannerAd;

  static void dispose() {
    _bannerAd?.dispose();
    _appOpenAd?.dispose();
  }
}
