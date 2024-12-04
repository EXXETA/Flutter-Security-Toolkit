import Flutter
import SecurityToolkit

public class ThreatCenterApiImpl: NSObject, FlutterPlugin, ThreatCenterApi {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger : FlutterBinaryMessenger = registrar.messenger()
        let api : ThreatCenterApi & NSObjectProtocol = ThreatCenterApiImpl.init()
        ThreatCenterApiSetup.setUp(binaryMessenger: messenger, api: api)
    }

    // MARK: - Threat Center Api
    
    func areRootPrivilegesDetected() throws -> Bool {
        ThreatDetectionCenter.areRootPrivilegesDetected
    }
    
    func areHooksDetected() throws -> Bool {
        ThreatDetectionCenter.areHooksDetected
    }
    
    func isSimulatorDetected() throws -> Bool {
        ThreatDetectionCenter.isSimulatorDetected
    }
}
