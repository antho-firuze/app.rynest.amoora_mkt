import 'package:amoora_mkt/cff/utils/log_utils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/network_service.dart';


final checkDataAvailableStreamProvider = StreamProvider<void>((ref) async* {
  while (true) {
    await Future.delayed(const Duration(seconds: 5));

    ref.read(networkCtrlProvider).isConnected = await ref.read(networkServiceProvider).checkDataAvailable();
    
  }
});

final networkCtrlProvider = Provider(NetworkCtrl.new);

class NetworkCtrl {
  Ref ref;
  NetworkCtrl(this.ref);

  final _kLogName = 'NETWORK-CTRL';

  bool isConnected = false;
  String wifiIPv4 = '*.*.*.*';
  String wifiName = '';
  String wifiBSSID = '';
  String wifiGatewayIP = '';
  String wifiBroadcast = '';
  String wifiSubmask = '';

  void initialize() {
    logI('Initialized', name: _kLogName);
    networkConnectivityListen();
  }

  void networkConnectivityListen() async {
    Connectivity().onConnectivityChanged.listen((event) async {
      if (event.contains(ConnectivityResult.wifi) || event.contains(ConnectivityResult.mobile)) {
        isConnected = await ref.read(networkServiceProvider).checkDataAvailable();
      } else if (event.contains(ConnectivityResult.none)) {
        isConnected = false;
      }
    });
  }

  void getNetworkInfo() async {
    wifiIPv4 = await ref.read(networkServiceProvider).getWifiIP();
    wifiName = await ref.read(networkServiceProvider).getWifiName();
    wifiBSSID = await ref.read(networkServiceProvider).getWifiBSSID();
    wifiGatewayIP = await ref.read(networkServiceProvider).getWifiGatewayIP();
    wifiBroadcast = await ref.read(networkServiceProvider).getWifiBroadcast();
    wifiSubmask = await ref.read(networkServiceProvider).getWifiSubmask();
  }
}

