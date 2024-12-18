import Flutter
import SecurityToolkit

public class FlutterSecurityToolkitPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_security_toolkit", binaryMessenger: registrar.messenger())
    let instance = FlutterSecurityToolkitPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method
     {
    case "areRootPrivilegesDetected":
        result(ThreatDetectionCenter.areRootPrivilegesDetected)
    case "areHooksDetected":
        result(ThreatDetectionCenter.areHooksDetected)
    case "isSimulatorDetected":
        result(ThreatDetectionCenter.isSimulatorDetected)
    case "isDebuggerDetected":
        result(ThreatDetectionCenter.isDebuggerDetected)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
