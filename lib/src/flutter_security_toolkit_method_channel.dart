import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_security_toolkit_platform_interface.dart';

/// An implementation of [FlutterSecurityToolkitPlatform] that uses method channels.
class MethodChannelFlutterSecurityToolkit
    extends FlutterSecurityToolkitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_security_toolkit');

  @override
  Future<bool?> areRootPrivilegesDetected() async {
    final version =
        await methodChannel.invokeMethod<bool>('areRootPrivilegesDetected');
    return version;
  }

  @override
  Future<bool?> areHooksDetected() async {
    final version = await methodChannel.invokeMethod<bool>('areHooksDetected');
    return version;
  }

  @override
  Future<bool?> isSimulatorDetected() async {
    final version =
        await methodChannel.invokeMethod<bool>('isSimulatorDetected');
    return version;
  }
}
