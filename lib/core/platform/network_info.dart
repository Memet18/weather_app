import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => hasConnect();

  Future<bool> hasConnect() async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await connectionChecker.checkConnectivity();

      return _updateConnectionStatus(result);
    } on PlatformException catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        return true;
      case ConnectivityResult.mobile:
        return true;
      case ConnectivityResult.none:
        return false;
      default:
        return false;
    }
  }
}
