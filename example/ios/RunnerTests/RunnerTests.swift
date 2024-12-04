import Flutter
import UIKit
import XCTest

@testable import flutter_security_toolkit

// This demonstrates a simple unit test of the Swift portion of this plugin's implementation.
//
// See https://developer.apple.com/documentation/xctest for more information about using XCTest.

class RunnerTests: XCTestCase {

  func testGetPlatformVersion() {
    let plugin = ThreatCenterApiImpl()
    let isRoot = plugin.areRootPrivilegesDetected
    XCTAssertEqual(isRoot, false)
  }

}
