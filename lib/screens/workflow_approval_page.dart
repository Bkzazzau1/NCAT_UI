import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_header.dart';
import '../widgets/status_chip.dart';

class WorkflowApprovalPage extends StatelessWidget {
  const WorkflowApprovalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final workflows = [
      ('Admission Approval', 'Registry → Department → Bursary → Admission Letter', '32 pending', Icons.how_to_reg_rounded),
      ('Result Approval', 'Lecturer → Exam Officer → HoD → Academic Office', '9 delayed', Icons.fact_check_rounded),
      ('Clearance Workflow', 'Bursary → Hostel → Library → Registry → Final Certificate', '43 blocked', Icons.verified_rounded),
      ('Transcript Request', 'Student Request → Payment → Registry → Dispatch', '12 ready', Icons.description_rounded),
      ('Maintenance Request', 'Report → AI Classify → Works/ICT → Supervisor Approval', '18 active', Icons.construction_rounded),
      ('Memo Approval', 'Draft → Unit Head → Director → Archive', '7 awaiting action', Icons.approval_rounded),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SectionHeader(
            icon: Icons.account_tree_rounded,
            title: 'Workflow & Approval Control',
            subtitle: 'AI monitors administrative processes, file movement, bottlenecks, staff actions and approval delays.',
            actionLabel: 'Run AI Audit',
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final count = constraints.maxWidth > 1000 ? 3 : constraints.maxWidth > 680 ? 2 : 1;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: workflows.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: count,
                  mainAxisExtent: 190,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                ),
                itemBuilder: (context, index) {
                  final item = workflows[index];
                  return GlassCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(item.$4, color: NCATTheme.cyan, size: 30),
                            const Spacer(),
                            StatusChip(item.$3),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(item.$1, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 17)),
                        const SizedBox(height: 8),
                        Text(item.$2, style: const TextStyle(color: NCATTheme.softText, height: 1.45)),
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
                const Text('Live Approval Timeline', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
                const SizedBox(height: 18),
                ...[
                  ('Result submitted by Lecturer', 'Today 09:20', true),
                  ('Exam Officer review pending', 'Today 11:00', true),
                  ('HoD approval delayed', '6 days', false),
                  ('Academic Office publication', 'Waiting', false),
                ].map((step) => Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: Row(
                        children: [
                          Icon(step.$3 ? Icons.check_circle_rounded : Icons.timelapse_rounded, color: step.$3 ? NCATTheme.green : NCATTheme.gold),
                          const SizedBox(width: 12),
                          Expanded(child: Text(step.$1, style: const TextStyle(fontWeight: FontWeight.w700))),
                          Text(step.$2, style: const TextStyle(color: NCATTheme.softText)),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
