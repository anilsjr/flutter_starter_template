# Ad Management Rules

## Implementation
- All ad logic must reside in `lib/core/services/ad_service.dart`.
- The `google_mobile_ads` package is used for AdMob integration.

## Ad Types Supported
### 1. Banner Ads
- Load using `AdService.loadBannerAd(adUnitId)`.
- Access using `AdService.bannerAd`.
- Ensure you dispose of the ad when it's no longer needed.

### 2. App Open Ads
- Load using `AdService.loadAppOpenAd(adUnitId)`.
- The `AppLifecycleReactor` in `lib/core/services/app_lifecycle_reactor.dart` handles showing the ad when the app comes to the foreground.
- Use `AdService.showAppOpenAdIfAvailable()` if you need to trigger it manually.

## Platform Constraints
- **Strict Rule:** ALWAYS guard ad-related code with `if (!kIsWeb)` as the `google_mobile_ads` plugin does not support the web platform and will crash the app.
- Use `AppLogger` to track ad loading and display events for debugging.

## Configuration
- Ad unit IDs should ideally be moved to `lib/core/constants/app_constants.dart` for easy management across different environments (dev/prod).
- Always use test ad unit IDs provided by Google during development.
