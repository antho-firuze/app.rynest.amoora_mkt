import 'dart:async';
import 'dart:io';

import 'package:amoora_mkt/cff/utils/log_utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network_info_plus/network_info_plus.dart';

class NetworkService {
  final Ref ref;
  NetworkService(this.ref);

  final _kLogName = 'NETWORK-SERVICE';
  final NetworkInfo _networkInfo = NetworkInfo();

  Future<bool> checkDataAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        logX('checkDataAvailable => true', name: _kLogName);
        return true;
      }

      logX('checkDataAvailable => false', name: _kLogName);
      return false;
    } catch (e) {
      logX('checkDataAvailable => false', name: _kLogName);
      return false;
    }
  }

  Future<String> getWifiIP() async {
    try {
      var result = await _networkInfo.getWifiIP() ?? '*.*.*.*';
      logX('getWifiIP => $result', name: _kLogName);
      return result;
    } on PlatformException catch (e) {
      logX('getWifiIP => Failed to get Wifi Name', error: e, name: _kLogName);
      return e.toString();
    }
  }

  Future<String> getWifiName() async {
    try {
      var result = await _networkInfo.getWifiName() ?? '';
      logX('getWifiName => $result', name: _kLogName);
      return result;
    } on PlatformException catch (e) {
      logX('getWifiName => Failed to get Wifi Name', error: e, name: _kLogName);
      return e.toString();
    }
  }

  Future<String> getWifiBSSID() async {
    try {
      var result = await _networkInfo.getWifiBSSID() ?? '';
      logX('getWifiBSSID => $result', name: _kLogName);
      return result;
    } on PlatformException catch (e) {
      logX('getWifiBSSID => Failed to get Wifi BSSID', error: e, name: _kLogName);
      return e.toString();
    }
  }

  Future<String> getWifiSubmask() async {
    try {
      var result = await _networkInfo.getWifiSubmask() ?? '';
      logX('getWifiSubmask => $result', name: _kLogName);
      return result;
    } on PlatformException catch (e) {
      logX('getWifiSubmask => Failed to get Wifi Submask', error: e, name: _kLogName);
      return e.toString();
    }
  }

  Future<String> getWifiBroadcast() async {
    try {
      var result = await _networkInfo.getWifiBroadcast() ?? '';
      logX('getWifiBroadcast => $result', name: _kLogName);
      return result;
    } on PlatformException catch (e) {
      logX('getWifiBroadcast => Failed to get Wifi Broadcast', error: e, name: _kLogName);
      return e.toString();
    }
  }

  Future<String> getWifiGatewayIP() async {
    try {
      var result = await _networkInfo.getWifiGatewayIP() ?? '';
      logX('getWifiGatewayIP => $result', name: _kLogName);
      return result;
    } on PlatformException catch (e) {
      logX('getWifiGatewayIP => Failed to get Wifi Gateway IP', error: e, name: _kLogName);
      return e.toString();
    }
  }

  // Future<InternetAddress> retrieveIPAddress() async {
  //   int code = Random().nextInt(255);
  //   var dgSocket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
  //   dgSocket.readEventsEnabled = true;
  //   dgSocket.broadcastEnabled = true;
  //   Future<InternetAddress> ret =
  //       dgSocket.timeout(const Duration(milliseconds: 100), onTimeout: (sink) {
  //     sink.close();
  //   }).expand<InternetAddress>((event) {
  //     if (event == RawSocketEvent.read) {
  //       Datagram? dg = dgSocket.receive();
  //       if (dg != null && dg.data.length == 1 && dg.data[0] == code) {
  //         dgSocket.close();
  //         return [dg.address];
  //       }
  //     }
  //     return [];
  //   }).firstWhere((InternetAddress a) => a != null);

  //   dgSocket.send([code], InternetAddress("255.255.255.255"), dgSocket.port);
  //   // logx('IP Address = ${ret}');
  //   ret.then((value) {
  //     logx(value.address);
  //   });
  //   logx('Port = ${dgSocket.port}');
  //   return ret;
  // }
}

final networkServiceProvider = Provider(NetworkService.new);
