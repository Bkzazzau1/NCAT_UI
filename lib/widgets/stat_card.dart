import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../models/demo_models.dart';
import 'glass_card.dart';

class StatCard extends StatelessWidget {
  const StatCard({super.key, required this.metric});

  final MetricItem metric;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final compact = constraints.maxHeight < 145;
          final iconSize = compact ? 38.0 : 42.0;
          final valueStyle = (compact
                  ? Theme.of(context).textTheme.headlineSmall
                  : Theme.of(context).textTheme.headlineMedium)
              ?.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: -1,
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: iconSize,
                    width: iconSize,
                    decoration: BoxDecoration(
                      color: metric.accent.withValues(alpha: .14),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: metric.accent.withValues(alpha: .35)),
                    ),
                    child: Icon(metric.icon,
                        color: metric.accent, size: compact ? 22 : 24),
                  ),
                  const Spacer(),
                  Icon(Icons.trending_up_rounded,
                      color: metric.accent.withValues(alpha: .8), size: 20),
                ],
              ),
              SizedBox(height: compact ? 10 : 14),
              Text(
                metric.value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: valueStyle,
              ),
              SizedBox(height: compact ? 2 : 4),
              Text(
                metric.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              SizedBox(height: compact ? 2 : 4),
              Text(
                metric.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: NCATTheme.softText, fontSize: 12),
              ),
            ],
          );
        },
      ),
    );
  }
}
