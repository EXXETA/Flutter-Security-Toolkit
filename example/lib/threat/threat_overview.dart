import 'package:flutter/material.dart';
import 'package:flutter_security_toolkit_example/shared/extensions.dart';
import 'package:flutter_security_toolkit_example/threat/threat_card.dart';

class ThreatOverview extends StatelessWidget {
  final bool hasRootPrivileges;
  final bool hasHooks;
  final bool isInSimulator;

  const ThreatOverview({
    required this.hasRootPrivileges,
    required this.hasHooks,
    required this.isInSimulator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Builder(builder: (context) {
            final textTheme = Theme.of(context).textTheme;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    hasRootPrivileges || hasHooks
                        ? Icons.lock_open
                        : Icons.lock,
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
                    status: hasRootPrivileges,
                  ),
                  ThreatCard(
                    title: 'Hooks',
                    description:
                        'Intercept system or application calls and then modify them (modify the return value of a function call for example)',
                    status: hasHooks,
                  ),
                  ThreatCard(
                    title: 'Simulator',
                    description: 'Running the application in an Simulator',
                    status: isInSimulator,
                  ),
                ],
              ),
            );
          }),
        ).padding(left: 20, right: 20),
      ),
    );
  }
}
