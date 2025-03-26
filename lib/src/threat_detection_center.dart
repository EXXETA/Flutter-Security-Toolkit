import 'dart:io';

import 'package:flutter_security_toolkit/src/threat_center_api.g.dart';

/// Use this class to access the methods of detecting security threats
/// Note: most methods are async
class ThreatDetectionCenter {
  static final _api = ThreatCenterApi();

  /// Will check for Jailbreak on iOS and for Root on Android.
  ///
  /// Returns true, if privileged access detected.
  static Future<bool?> areRootPrivilegesDetected() {
    return _api.areRootPrivilegesDetected();
  }

  /// Will check for runtime integrity by detecting hooks / dynamic injection
  /// libraries.
  ///
  /// Returns true, if any hooks are detected
  static Future<bool?> areHooksDetected() async {
    return Socket.connect("127.0.0.1", 27042)
        .then((_) => true)
        .catchError((_) => _api.areHooksDetected());
  }

  /// Will check for an environment and return true, if running in simulated /
  /// emulated environment
  static Future<bool?> isSimulatorDetected() {
    return _api.isSimulatorDetected();
  }
}
