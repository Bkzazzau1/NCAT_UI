import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_header.dart';
import '../widgets/status_chip.dart';

class AIPracticalManagementPage extends StatelessWidget {
  const AIPracticalManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        SectionHeader(
          icon: Icons.engineering_rounded,
          title: 'AI Practical Management',
          subtitle:
              'Manage students, lecturers, instructors, practical sessions, equipment, attendance, safety checks, scores and logbook validation from one command page.',
          actionLabel: 'Schedule practical',
        ),
        SizedBox(height: 18),
        _PracticalSummary(),
        SizedBox(height: 14),
        _SessionBoard(),
        SizedBox(height: 14),
        _LecturerPanel(),
      ],
    );
  }
}

class _PracticalSummary extends StatelessWidget {
  const _PracticalSummary();

  @override
  Widget build(BuildContext context) {
    return const GlassCard(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('AI Practical Intelligence Summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
        SizedBox(height: 10),
        Text('AI links practical timetable, lecturer assignment, student attendance, equipment readiness, safety checklist, logbook entries and practical assessment results. It alerts management when a practical is delayed, unsafe, poorly attended or missing instructor validation.', style: TextStyle(color: NCATTheme.softText, height: 1.5)),
        SizedBox(height: 14),
        Wrap(spacing: 10, runSpacing: 10, children: [
          StatusChip('24 practicals today', color: NCATTheme.cyan),
          StatusChip('6 need equipment checks', color: NCATTheme.gold),
          StatusChip('3 delayed sessions', color: NCATTheme.red),
          StatusChip('18 lecturer validations pending', color: NCATTheme.gold),
        ]),
      ]),
    );
  }
}

class _SessionBoard extends StatelessWidget {
  const _SessionBoard();

  @override
  Widget build(BuildContext context) {
    final sessions = const [
      _Session('Landing Approach Practical', 'Pilot Phase II', 'Capt. Yusuf', 'Simulator Centre', 'Ready'),
      _Session('Aircraft Engine Inspection', 'AME 200L', 'Engr. Musa', 'AME Workshop', 'Equipment Check'),
      _Session('Radio Communication Drill', 'ATC Class', 'Mrs. Fatima', 'ATC Lab', 'Delayed'),
      _Session('Safety Procedure Drill', 'Aviation Ops', 'Safety Unit', 'Hangar 2', 'Ready'),
    ];

    return GlassCard(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Practical Session Board', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
        const SizedBox(height: 8),
        const Text('AI shows which practicals are ready, delayed, missing equipment checks, or awaiting lecturer validation.', style: TextStyle(color: NCATTheme.softText)),
        const SizedBox(height: 16),
        for (final session in sessions) _SessionRow(session: session),
      ]),
    );
  }
}

class _Session {
  const _Session(this.title, this.group, this.lecturer, this.location, this.status);
  final String title;
  final String group;
  final String lecturer;
  final String location;
  final String status;
}

class _SessionRow extends StatelessWidget {
  const _SessionRow({required this.session});
  final _Session session;

  @override
  Widget build(BuildContext context) {
    final color = session.status == 'Ready' ? NCATTheme.green : session.status == 'Delayed' ? NCATTheme.red : NCATTheme.gold;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white.withValues(alpha: .045), borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.white.withValues(alpha: .10))),
      child: Row(children: [
        const Icon(Icons.science_rounded, color: NCATTheme.cyan),
        const SizedBox(width: 12),
        Expanded(flex: 3, child: Text(session.title, style: const TextStyle(fontWeight: FontWeight.w900))),
        Expanded(flex: 2, child: Text(session.group, style: const TextStyle(color: NCATTheme.softText))),
        Expanded(flex: 2, child: Text(session.lecturer, style: const TextStyle(color: NCATTheme.softText))),
        Expanded(flex: 2, child: Text(session.location, style: const TextStyle(color: NCATTheme.softText))),
        StatusChip(session.status, color: color),
      ]),
    );
  }
}

class _LecturerPanel extends StatelessWidget {
  const _LecturerPanel();

  @override
  Widget build(BuildContext context) {
    return const GlassCard(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Lecturer & Instructor Controls', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
        SizedBox(height: 10),
        Text('Lecturers can mark practical attendance, validate safety checklist, approve student logbooks, upload practical scores and submit remarks. AI flags missing attendance, repeated absence, equipment issues and inconsistent scores.', style: TextStyle(color: NCATTheme.softText, height: 1.5)),
        SizedBox(height: 14),
        Wrap(spacing: 10, runSpacing: 10, children: [
          StatusChip('Attendance capture'),
          StatusChip('Safety checklist'),
          StatusChip('Practical scoring'),
          StatusChip('Logbook approval'),
          StatusChip('AI anomaly alert'),
        ]),
      ]),
    );
  }
}
