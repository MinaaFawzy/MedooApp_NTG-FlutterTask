import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkConnection() async {
  try {
    final results = await Connectivity().checkConnectivity();

    final hasInternet = results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.wifi);

    return hasInternet;
  } catch (e) {
    return false;
  }
}


