import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_service.dart';

/// Listens for the app to come into the foreground and shows an app open ad.
class AppLifecycleReactor {
  AppLifecycleReactor();

  void listenToAppStateChanges() {
    AppStateEventNotifier.startListening();
    AppStateEventNotifier.appStateStream.forEach((state) => _onAppStateChanged(state));
  }

  void _onAppStateChanged(AppState state) {
    if (state == AppState.foreground) {
      AdService.showAppOpenAdIfAvailable();
    }
  }
}
