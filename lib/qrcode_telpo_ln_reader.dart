import 'dart:async';
import 'package:flutter/services.dart';

class QrcodeTelpoLnReader {
  static const MethodChannel _channel =
      MethodChannel('qrcode_telpo_ln_reader');

  static const EventChannel _eventChannel =
      EventChannel('qrcode_telpo_ln_reader_event');

  /// Ouvre le lecteur Telpo
  static Future<void> openReader() async {
    await _channel.invokeMethod('openReader');
  }

  /// Ferme le lecteur Telpo
  static Future<void> closeReader() async {
    await _channel.invokeMethod('closeReader');
  }

  /// Lance un scan QR code
  static Future<void> startScan() async {
    await _channel.invokeMethod('startScan');
  }

  /// Stream en temps réel des données scannées
  static Stream<String> get onScanData {
    return _eventChannel.receiveBroadcastStream().cast<String>();
  }
}
