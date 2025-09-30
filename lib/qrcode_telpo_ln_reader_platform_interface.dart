import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'qrcode_telpo_ln_reader_method_channel.dart';

abstract class QrcodeTelpoLnReaderPlatform extends PlatformInterface {
  /// Constructs a QrcodeTelpoLnReaderPlatform.
  QrcodeTelpoLnReaderPlatform() : super(token: _token);

  static final Object _token = Object();

  static QrcodeTelpoLnReaderPlatform _instance = MethodChannelQrcodeTelpoLnReader();

  /// The default instance of [QrcodeTelpoLnReaderPlatform] to use.
  ///
  /// Defaults to [MethodChannelQrcodeTelpoLnReader].
  static QrcodeTelpoLnReaderPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [QrcodeTelpoLnReaderPlatform] when
  /// they register themselves.
  static set instance(QrcodeTelpoLnReaderPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
