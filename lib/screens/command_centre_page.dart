import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../data/demo_data.dart';
import '../widgets/ai_assistant_panel.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_header.dart';
import '../widgets/stat_card.dart';
import '../widgets/status_chip.dart';

class CommandCentrePage extends StatelessWidget {
  const CommandCentrePage({super.key});

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
                  icon: Icons.dashboard_customize_rounded,
                  title: 'AI Executive Command Centre',
                  subtitle: 'Real-time intelligence across students, files, flight training, approvals, safety and infrastructure.',
                  actionLabel: 'Generate Rector Brief',
                ),
                const SizedBox(height: 20),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final count = constraints.maxWidth > 980 ? 4 : constraints.maxWidth > 650 ? 2 : 1;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: executiveMetrics.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: count,
                        mainAxisExtent: 170,
                        mainAxisSpacing: 14,
                        crossAxisSpacing: 14,
                      ),
                      itemBuilder: (context, index) => StatCard(metric: executiveMetrics[index]),
                    );
                  },
                ),
                const SizedBox(height: 18),
                GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.auto_awesome_rounded, color: NCATTheme.cyan),
                          SizedBox(width: 10),
                          Text('AI Priority Alerts', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ...aiAlerts.map((alert) => Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.05),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(color: Colors.white.withOpacity(.08)),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 44,
                                  width: 44,
                                  decoration: BoxDecoration(
                                    color: NCATTheme.cyan.withOpacity(.10),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Icon(Icons.notification_important_rounded, color: NCATTheme.cyan),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(alert.title, style: const TextStyle(fontWeight: FontWeight.w800)),
                                      const SizedBox(height: 4),
                                      Text(alert.message, style: const TextStyle(color: NCATTheme.softText, fontSize: 13)),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    StatusChip(alert.severity),
                                    const SizedBox(height: 8),
                                    Text(alert.owner, style: const TextStyle(color: NCATTheme.softText, fontSize: 11)),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                if (!isWide) ...[
                  const SizedBox(height: 18),
                  const AIAssistantPanel(),
                ],
              ],
            ),
          ),
          if (isWide) ...[
            const SizedBox(width: 18),
            const SizedBox(width: 370, child: AIAssistantPanel()),
          ],
        ],
      ),
    );
  }
}
