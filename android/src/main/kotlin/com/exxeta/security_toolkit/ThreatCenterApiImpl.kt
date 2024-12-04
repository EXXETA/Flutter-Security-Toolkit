
package com.exxeta.security_toolkit

import ThreatCenterApi
import com.exxeta.securitytoolkit.ThreatDetectionCenter
import io.flutter.embedding.engine.plugins.FlutterPlugin

class ThreatCenterApiImpl : FlutterPlugin, ThreatCenterApi {
  private lateinit var threatDetectionCenter: ThreatDetectionCenter

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    threatDetectionCenter = ThreatDetectionCenter(binding.applicationContext)
    ThreatCenterApi.setUp(binding.binaryMessenger, this)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    ThreatCenterApi.setUp(binding.binaryMessenger, null)
  }

  // MARK: - ThreatCenterApi

  override fun areRootPrivilegesDetected(): Boolean {
    return threatDetectionCenter.areRootPrivilegesDetected
  }

  override fun areHooksDetected(): Boolean {
    return threatDetectionCenter.areHooksDetected
  }

  override fun isSimulatorDetected(): Boolean {
    return threatDetectionCenter.isSimulatorDetected
  }
}