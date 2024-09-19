package com.example.flutter_security_toolkit

import android.app.Activity
import android.content.Context
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.exxeta.securitytoolkit.ThreatDetectionCenter

/** FlutterSecurityToolkitPlugin */
class FlutterSecurityToolkitPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Context
  private lateinit var activity: Activity
  private lateinit var threatDetectionCenter: ThreatDetectionCenter

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_security_toolkit")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
    threatDetectionCenter = ThreatDetectionCenter(flutterPluginBinding.applicationContext)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "areRootPrivilegesDetected") {
      result.success(threatDetectionCenter.areRootPrivilegesDetected)
    } else if (call.method == "areHooksDetected") {
      result.success(threatDetectionCenter.areHooksDetected)
    } else if (call.method == "isSimulatorDetected") {
      result.success(threatDetectionCenter.isSimulatorDetected)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  // MARK: - Activity & Context management

  override fun onDetachedFromActivity() {
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity;
  }

  override fun onDetachedFromActivityForConfigChanges() {
  }
}
