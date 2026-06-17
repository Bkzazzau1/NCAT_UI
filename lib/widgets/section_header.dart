import 'package:flutter/material.dart';

import '../app/theme.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.actionLabel,
    this.icon,
  });

  final String title;
  final String subtitle;
  final String? actionLabel;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (icon != null)
          Container(
            height: 46,
            width: 46,
            margin: const EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                  colors: [NCATTheme.blue, NCATTheme.cyan]),
            ),
            child: Icon(icon, color: Colors.white),
          ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                      letterSpacing: -.5,
                    ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: NCATTheme.softText),
              ),
            ],
          ),
        ),
        if (actionLabel != null)
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.auto_awesome_rounded, size: 18),
            label: Text(actionLabel!),
          ),
      ],
    );
  }
}
