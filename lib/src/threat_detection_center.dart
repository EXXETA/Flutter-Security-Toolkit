import 'flutter_security_toolkit_platform_interface.dart';

/// Use this class to access the methods of detecting security threats
/// Note: most methods are async
class ThreatDetectionCenter {
  /// Will check for Jailbreak on iOS and for Root on Android.
  ///
  /// Returns true, if privileged access detected.
  static Future<bool?> areRootPrivilegesDetected() {
    return FlutterSecurityToolkitPlatform.instance.areRootPrivilegesDetected();
  }

  /// Will check for runtime integrity by detecting hooks / dynamic injection
  /// libraries.
  ///
  /// Returns true, if any hooks are detected
  static Future<bool?> areHooksDetected() {
    return FlutterSecurityToolkitPlatform.instance.areHooksDetected();
  }

  /// Will check for an environment and return true, if running in simulated /
  /// emulated environment
  static Future<bool?> isSimulatorDetected() {
    return FlutterSecurityToolkitPlatform.instance.isSimulatorDetected();
  }

  /// Will check if your application is being traced by a debugger.
  ///
  /// Returns true if a debugger is detected.
  ///
  /// A debugger is a tool that allows developers to inspect and modify the execution of a program in real-time, potentially exposing sensitive data or allowing unauthorized control.
  ///
  /// Please note that Apple itself uses a debugger during reviews. If you perform a debugger prevention, you could prevent Apple from carrying out a complete review, which they certainly will not like.
  static Future<bool?> isDebuggerDetected() {
    return FlutterSecurityToolkitPlatform.instance.isDebuggerDetected();
  }
}
