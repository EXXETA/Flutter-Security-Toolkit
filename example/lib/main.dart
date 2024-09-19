import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_security_toolkit/threat_detection_center.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _jailbroken = false;
  bool _hooks = false;
  bool _simulator = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      final (jailbroken, hooks, simulator) = await (
        ThreatDetectionCenter.areRootPrivilegesDetected(),
        ThreatDetectionCenter.areHooksDetected(),
        ThreatDetectionCenter.isSimulatorDetected(),
      ).wait;

      if (!mounted) return;

      setState(() {
        _jailbroken = jailbroken ?? _jailbroken;
        _hooks = hooks ?? _hooks;
        _simulator = simulator ?? _simulator;
      });
    } on PlatformException {
      // Do nothing
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Builder(builder: (context) {
              final textTheme = Theme.of(context).textTheme;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _jailbroken || _hooks ? Icons.lock_open : Icons.lock,
                    size: 80,
                  ).padding(bottom: 24),
                  Text(
                    'Protection',
                    style: textTheme.headlineLarge,
                  ).padding(bottom: 8),
                  Text(
                    'Here is a list of the threats that could put you at risk',
                    style: textTheme.titleMedium?.copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ).padding(bottom: 16),
                  ThreatCard(
                    title: 'Jailbreak / Root',
                    description:
                        'Is a way of acquiring privileged control over the operating system of a device. Tools such as Magisk or Shadow can hide the privileged access',
                    status: _jailbroken,
                  ),
                  ThreatCard(
                    title: 'Hooks',
                    description:
                        'Intercept system or application calls and then modify them (modify the return value of a function call for example)',
                    status: _hooks,
                  ),
                  ThreatCard(
                    title: 'Simulator',
                    description: 'Running the application in an Simulator',
                    status: _simulator,
                  ),
                ],
              );
            }),
          ).padding(left: 20, right: 20),
        ),
      ),
    );
  }
}

class ThreatCard extends StatelessWidget {
  final String title;
  final String description;
  final bool status;

  const ThreatCard({
    required this.title,
    required this.description,
    required this.status,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: textTheme.titleLarge?.copyWith(color: Colors.black),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: !status ? Colors.green : Colors.red,
                child: Column(
                  children: [
                    Text(
                      !status ? 'SAFE' : 'DETECTED',
                      style: textTheme.bodySmall?.copyWith(color: Colors.white),
                    ),
                  ],
                ).paddingAll(8),
              )
            ],
          ).padding(bottom: 8),
          Text(
            description,
            style: textTheme.titleMedium?.copyWith(color: Colors.grey),
            textAlign: TextAlign.start,
          ),
        ],
      ).paddingAll(16),
    ).paddingAll(8);
  }
}

extension PaddedWidget on Widget {
  Widget padding({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        ),
        child: this,
      );

  Widget paddingAll(double all) =>
      padding(left: all, top: all, right: all, bottom: all);
}
