import 'package:flutter/material.dart';
import 'package:flutter_security_toolkit_example/shared/extensions.dart';

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
