import 'package:flutter/services.dart';
import 'package:flutter_security_toolkit/flutter_security_toolkit_method_channel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFlutterSecurityToolkit platform =
      MethodChannelFlutterSecurityToolkit();
  const MethodChannel channel = MethodChannel('flutter_security_toolkit');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.areRootPrivilegesDetected(), false);
  });
}
