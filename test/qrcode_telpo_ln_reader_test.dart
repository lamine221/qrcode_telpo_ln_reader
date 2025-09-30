import 'package:flutter_test/flutter_test.dart';
import 'package:qrcode_telpo_ln_reader/qrcode_telpo_ln_reader.dart';
import 'package:qrcode_telpo_ln_reader/qrcode_telpo_ln_reader_platform_interface.dart';
import 'package:qrcode_telpo_ln_reader/qrcode_telpo_ln_reader_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockQrcodeTelpoLnReaderPlatform
    with MockPlatformInterfaceMixin
    implements QrcodeTelpoLnReaderPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final QrcodeTelpoLnReaderPlatform initialPlatform = QrcodeTelpoLnReaderPlatform.instance;

  test('$MethodChannelQrcodeTelpoLnReader is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelQrcodeTelpoLnReader>());
  });

  test('getPlatformVersion', () async {
    QrcodeTelpoLnReader qrcodeTelpoLnReaderPlugin = QrcodeTelpoLnReader();
    MockQrcodeTelpoLnReaderPlatform fakePlatform = MockQrcodeTelpoLnReaderPlatform();
    QrcodeTelpoLnReaderPlatform.instance = fakePlatform;

    expect(await qrcodeTelpoLnReaderPlugin.getPlatformVersion(), '42');
  });
}
