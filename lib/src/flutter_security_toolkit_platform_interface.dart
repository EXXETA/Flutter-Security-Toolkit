import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_security_toolkit_method_channel.dart';

abstract class FlutterSecurityToolkitPlatform extends PlatformInterface {
  /// Constructs a FlutterSecurityToolkitPlatform.
  FlutterSecurityToolkitPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterSecurityToolkitPlatform _instance =
      MethodChannelFlutterSecurityToolkit();

  /// The default instance of [FlutterSecurityToolkitPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterSecurityToolkit].
  static FlutterSecurityToolkitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterSecurityToolkitPlatform] when
  /// they register themselves.
  static set instance(FlutterSecurityToolkitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> areRootPrivilegesDetected() {
    throw UnimplementedError('isJailbroken() has not been implemented.');
  }

  Future<bool?> areHooksDetected() {
    throw UnimplementedError('areHooksLoaded() has not been implemented.');
  }

  Future<bool?> isSimulatorDetected() {
    throw UnimplementedError(
        'isRunningInSimulator() has not been implemented.');
  }

  Future<bool?> isDebuggerDetected() {
    throw UnimplementedError(
        'isDebuggerDetected() has not been implemented.');
  }
}
