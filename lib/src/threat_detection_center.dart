import 'flutter_security_toolkit_platform_interface.dart';

class ThreatDetectionCenter {
  static Future<bool?> areRootPrivilegesDetected() {
    return FlutterSecurityToolkitPlatform.instance.areRootPrivilegesDetected();
  }

  static Future<bool?> areHooksDetected() {
    return FlutterSecurityToolkitPlatform.instance.areHooksDetected();
  }

  static Future<bool?> isSimulatorDetected() {
    return FlutterSecurityToolkitPlatform.instance.isSimulatorDetected();
  }
}
