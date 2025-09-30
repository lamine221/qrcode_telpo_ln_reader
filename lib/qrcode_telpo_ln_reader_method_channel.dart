import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'qrcode_telpo_ln_reader_platform_interface.dart';

/// An implementation of [QrcodeTelpoLnReaderPlatform] that uses method channels.
class MethodChannelQrcodeTelpoLnReader extends QrcodeTelpoLnReaderPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('qrcode_telpo_ln_reader');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
