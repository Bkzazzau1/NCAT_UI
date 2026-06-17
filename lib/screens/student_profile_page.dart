import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../data/demo_data.dart';
import '../widgets/ai_assistant_panel.dart';
import '../widgets/glass_card.dart';
import '../widgets/progress_ring.dart';
import '../widgets/section_header.dart';
import '../widgets/status_chip.dart';

class StudentProfilePage extends StatelessWidget {
  const StudentProfilePage({super.key});

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
                  icon: Icons.badge_rounded,
                  title: 'Student Profile & AI Summary',
                  subtitle:
                      'A single intelligent profile showing biodata, files, fees, training, flight hours, risk and clearance readiness.',
                ),
                const SizedBox(height: 20),
                GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  colors: [NCATTheme.blue, NCATTheme.cyan]),
                            ),
                            child: const Icon(Icons.person_rounded,
                                color: Colors.white, size: 38),
                          ),
                          const SizedBox(width: 18),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(demoStudent.name,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900)),
                                const SizedBox(height: 6),
                                Text(
                                    '${demoStudent.regNo} • ${demoStudent.programme}',
                                    style: const TextStyle(
                                        color: NCATTheme.softText)),
                                const SizedBox(height: 8),
                                Wrap(
                                  spacing: 8,
                                  children: [
                                    StatusChip(demoStudent.level),
                                    StatusChip(
                                        'Risk ${demoStudent.riskScore}%'),
                                    StatusChip(demoStudent.clearanceStatus),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final wrap = constraints.maxWidth < 680;
                          final rings = [
                            ProgressRing(
                                value: demoStudent.fileCompletion,
                                label: 'File Complete',
                                color: NCATTheme.gold),
                            ProgressRing(
                                value: demoStudent.attendance,
                                label: 'Attendance',
                                color: NCATTheme.green),
                            ProgressRing(
                                value: demoStudent.riskScore / 100,
                                label: 'Risk Score',
                                color: NCATTheme.red),
                          ];
                          if (wrap) {
                            return Wrap(
                                spacing: 18, runSpacing: 18, children: rings);
                          }
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: rings);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('AI Student Summary',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 18)),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: NCATTheme.cyan.withValues(alpha: .08),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: NCATTheme.cyan.withValues(alpha: .18)),
                        ),
                        child: const Text(
                          'AI detected that this student file is 78% complete. Missing items are medical clearance and hostel approval. Flight progress is acceptable, but the student has a medium risk score due to clearance delay and a recent training gap.',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isNarrow = constraints.maxWidth < 760;
                    final items = [
                      _InfoCard(
                          title: 'Flight Hours',
                          value: '${demoStudent.flightHours}',
                          icon: Icons.flight_rounded),
                      _InfoCard(
                          title: 'Simulator Hours',
                          value: '${demoStudent.simulatorHours}',
                          icon: Icons.airline_seat_recline_normal_rounded),
                      const _InfoCard(
                          title: 'Missing Documents',
                          value: '2',
                          icon: Icons.folder_off_rounded),
                      const _InfoCard(
                          title: 'Pending Approvals',
                          value: '3',
                          icon: Icons.pending_actions_rounded),
                    ];
                    return GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: isNarrow ? 1 : 4,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: isNarrow ? 4.4 : 1.25,
                      children: items,
                    );
                  },
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

class _InfoCard extends StatelessWidget {
  const _InfoCard(
      {required this.title, required this.value, required this.icon});

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          Icon(icon, color: NCATTheme.cyan),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(value,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w900)),
                Text(title,
                    style: const TextStyle(
                        color: NCATTheme.softText, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
