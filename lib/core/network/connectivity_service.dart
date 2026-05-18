import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityProvider = StreamProvider<ConnectivityResult>((ref) {
  return Connectivity().onConnectivityChanged.map((results) => results.first);
});

class ConnectivityService {
  static Future<bool> hasConnection() async {
    final results = await Connectivity().checkConnectivity();
    return results.first != ConnectivityResult.none;
  }
}
