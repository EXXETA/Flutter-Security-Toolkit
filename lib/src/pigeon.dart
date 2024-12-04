@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/threat_center_api.g.dart',
  dartOptions: DartOptions(),
  kotlinOut:
      'android/src/main/kotlin/com/exxeta/flutter_security_toolkit/ThreatCenterApi.g.kt',
  kotlinOptions: KotlinOptions(),
  swiftOut: 'ios/Classes/ThreatCenterApi.g.swift',
  swiftOptions: SwiftOptions(),
  dartPackageName: 'flutter_security_toolkit',
))
@HostApi()
abstract class ThreatCenterApi {
  bool areRootPrivilegesDetected();
  bool areHooksDetected();
  bool isSimulatorDetected();
}
