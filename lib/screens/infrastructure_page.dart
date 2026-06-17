import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../data/demo_data.dart';
import '../widgets/ai_assistant_panel.dart';
import '../widgets/glass_card.dart';
import '../widgets/progress_ring.dart';
import '../widgets/section_header.dart';
import '../widgets/status_chip.dart';

class InfrastructurePage extends StatelessWidget {
  const InfrastructurePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 1180;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                const SectionHeader(
                  icon: Icons.hub_rounded,
                  title: 'AI Infrastructure Command Centre',
                  subtitle: 'AI visibility for facilities, simulators, ICT, hostels, power, safety, maintenance and institutional assets.',
                  actionLabel: 'Generate Infra Report',
                ),
                const SizedBox(height: 20),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final count = constraints.maxWidth > 1000 ? 4 : constraints.maxWidth > 620 ? 2 : 1;
                    final metrics = [
                      ('Registered Assets', '214', Icons.domain_rounded, NCATTheme.cyan),
                      ('Active Work Orders', '18', Icons.construction_rounded, NCATTheme.gold),
                      ('Critical Alerts', '3', Icons.warning_rounded, NCATTheme.red),
                      ('Safety Checks Due', '7', Icons.health_and_safety_rounded, NCATTheme.purple),
                    ];
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: metrics.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: count,
                        mainAxisExtent: 150,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 14,
                      ),
                      itemBuilder: (context, index) {
                        final m = metrics[index];
                        return GlassCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(m.$3, color: m.$4, size: 28),
                              const Spacer(),
                              Text(m.$2, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
                              Text(m.$1, style: const TextStyle(color: NCATTheme.softText)),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 18),
                GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Asset Health Monitor', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
                      const SizedBox(height: 14),
                      ...infrastructureAssets.map((asset) => Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.05),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(color: Colors.white.withOpacity(.08)),
                            ),
                            child: Row(
                              children: [
                                ProgressRing(value: asset.health, label: 'Health', color: asset.health < .5 ? NCATTheme.red : NCATTheme.gold, size: 82),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(asset.name, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
                                      const SizedBox(height: 5),
                                      Text('${asset.category} • ${asset.location}', style: const TextStyle(color: NCATTheme.softText)),
                                      const SizedBox(height: 8),
                                      Text(asset.nextAction, style: const TextStyle(fontSize: 13)),
                                    ],
                                  ),
                                ),
                                StatusChip(asset.status),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                if (!isWide) ...[
                  const SizedBox(height: 18),
                  const AIAssistantPanel(compact: true),
                ],
              ],
            ),
          ),
          if (isWide) ...[
            const SizedBox(width: 18),
            const SizedBox(width: 370, child: AIAssistantPanel(compact: true)),
          ],
        ],
      ),
    );
  }
}
