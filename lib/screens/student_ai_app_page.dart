import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_header.dart';
import '../widgets/status_chip.dart';

class StudentAIAppPage extends StatelessWidget {
  const StudentAIAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        SectionHeader(
          icon: Icons.psychology_alt_rounded,
          title: 'AI Student 360 Management',
          subtitle: 'A premium student command page for records, documents, attendance, training, logbooks, service requests and academic support.',
          actionLabel: 'Run AI scan',
        ),
        SizedBox(height: 18),
        GlassCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Student 360 Summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
              SizedBox(height: 10),
              Text('AI summarizes each student record, shows pending actions, recommends the next office to act, and keeps staff approvals under full human control.', style: TextStyle(color: NCATTheme.softText, height: 1.5)),
              SizedBox(height: 14),
              Wrap(spacing: 10, runSpacing: 10, children: [
                StatusChip('Attendance 84%', color: NCATTheme.green),
                StatusChip('File 78%', color: NCATTheme.gold),
                StatusChip('Training pending', color: NCATTheme.gold),
                StatusChip('Action needed', color: NCATTheme.red),
              ]),
            ],
          ),
        ),
        SizedBox(height: 14),
        GlassCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Student App AI Tools', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
              SizedBox(height: 10),
              Text('Handbook AI answers approved policy questions. Logbook AI helps students structure flight, simulator and workshop entries before instructor approval. Academic AI explains topics, creates revision questions and recommends weak areas.', style: TextStyle(color: NCATTheme.softText, height: 1.5)),
              SizedBox(height: 14),
              Wrap(spacing: 10, runSpacing: 10, children: [
                StatusChip('AI Handbook'),
                StatusChip('Voice Logbook'),
                StatusChip('Academic Coach'),
                StatusChip('Offline Sync'),
                StatusChip('Smart Notices'),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
