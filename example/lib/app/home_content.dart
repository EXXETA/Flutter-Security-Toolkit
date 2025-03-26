import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_security_toolkit/flutter_security_toolkit.dart';
import 'package:flutter_security_toolkit_example/threat/threat_overview.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool _rootPrivileges = false;
  bool _hooks = false;
  bool _simulator = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    try {
      final (jailbroken, hooks, simulator) = await (
        ThreatDetectionCenter.areRootPrivilegesDetected(),
        ThreatDetectionCenter.areHooksDetected(),
        ThreatDetectionCenter.isSimulatorDetected(),
      ).wait;

      if (!mounted) return;

      setState(() {
        _rootPrivileges = jailbroken ?? _rootPrivileges;
        _hooks = hooks ?? _hooks;
        _simulator = simulator ?? _simulator;
      });
    } on PlatformException {
      // Do nothing
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThreatOverview(
      hasRootPrivileges: _rootPrivileges,
      hasHooks: _hooks,
      isInSimulator: _simulator,
    );
  }
}
