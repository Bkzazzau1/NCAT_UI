import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../data/demo_data.dart';
import '../widgets/ai_assistant_panel.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_header.dart';
import '../widgets/status_chip.dart';

class MissingFilePage extends StatelessWidget {
  const MissingFilePage({super.key});

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
                  icon: Icons.folder_off_rounded,
                  title: 'AI Missing File Intelligence',
                  subtitle: 'AI detects missing student, administrative, training, payment, compliance and infrastructure files.',
                  actionLabel: 'Notify Offices',
                ),
                const SizedBox(height: 20),
                GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Detected Missing Files', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
                      const SizedBox(height: 14),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          headingTextStyle: const TextStyle(color: NCATTheme.softText, fontWeight: FontWeight.w800),
                          columns: const [
                            DataColumn(label: Text('Owner / Ref')),
                            DataColumn(label: Text('Category')),
                            DataColumn(label: Text('Missing Item')),
                            DataColumn(label: Text('Responsible Unit')),
                            DataColumn(label: Text('Days')),
                            DataColumn(label: Text('Priority')),
                          ],
                          rows: missingFiles
                              .map(
                                (item) => DataRow(
                                  cells: [
                                    DataCell(Text(item.owner)),
                                    DataCell(Text(item.category)),
                                    DataCell(SizedBox(width: 260, child: Text(item.missing))),
                                    DataCell(Text(item.department)),
                                    DataCell(Text('${item.daysPending}')),
                                    DataCell(StatusChip(item.priority)),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                GlassCard(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.auto_fix_high_rounded, color: NCATTheme.cyan),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('AI Recommendation', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17)),
                            SizedBox(height: 8),
                            Text(
                              'Create automated reminders for Medical, Hostel, Procurement and Safety units. Escalate files pending above 7 days to the responsible supervisor. Mark Hangar 2 compliance file as urgent because safety inspection is overdue.',
                              style: TextStyle(color: NCATTheme.softText, height: 1.5),
                            ),
                          ],
                        ),
                      ),
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
