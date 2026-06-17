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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  color: metric.accent.withValues(alpha: .14),
                  borderRadius: BorderRadius.circular(16),
                  border:
                      Border.all(color: metric.accent.withValues(alpha: .35)),
                ),
                child: Icon(metric.icon, color: metric.accent),
              ),
              const Spacer(),
              Icon(Icons.trending_up_rounded,
                  color: metric.accent.withValues(alpha: .8), size: 20),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            metric.value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1,
                ),
          ),
          const SizedBox(height: 4),
          Text(metric.title,
              style: const TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          Text(metric.subtitle,
              style: const TextStyle(color: NCATTheme.softText, fontSize: 12)),
        ],
      ),
    );
  }
}
