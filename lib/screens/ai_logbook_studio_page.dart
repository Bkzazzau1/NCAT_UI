import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_header.dart';
import '../widgets/status_chip.dart';

class AILogbookStudioPage extends StatelessWidget {
  const AILogbookStudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        SectionHeader(
          icon: Icons.edit_note_rounded,
          title: 'AI Logbook Studio',
          subtitle:
              'Voice-assisted flight, simulator and workshop logbook filling with missing-field checks, instructor approval and training-office validation.',
          actionLabel: 'Start logbook entry',
        ),
        SizedBox(height: 18),
        _LogbookKpis(),
        SizedBox(height: 14),
        _VoiceEntryCard(),
        SizedBox(height: 14),
        _ApprovalQueue(),
        SizedBox(height: 14),
        _ValidationRules(),
      ],
    );
  }
}

class _LogbookKpis extends StatelessWidget {
  const _LogbookKpis();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _Kpi(label: 'Pending Entries', value: '37', icon: Icons.pending_actions_rounded, color: NCATTheme.gold),
        _Kpi(label: 'Approved Today', value: '89', icon: Icons.task_alt_rounded, color: NCATTheme.green),
        _Kpi(label: 'Missing Fields', value: '18', icon: Icons.error_outline_rounded, color: NCATTheme.red),
        _Kpi(label: 'Training Hours Logged', value: '426h', icon: Icons.timer_rounded, color: NCATTheme.cyan),
      ],
    );
  }
}

class _Kpi extends StatelessWidget {
  const _Kpi({required this.label, required this.value, required this.icon, required this.color});
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: GlassCard(
        padding: const EdgeInsets.all(16),
        child: Row(children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
              Text(label, style: const TextStyle(color: NCATTheme.softText, fontSize: 12)),
            ]),
          ),
        ]),
      ),
    );
  }
}

class _VoiceEntryCard extends StatelessWidget {
  const _VoiceEntryCard();

  @override
  Widget build(BuildContext context) {
    return const GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Voice-to-Logbook Entry', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          SizedBox(height: 10),
          Text('Student voice note: Today we practiced landing approach, runway alignment and flare control with Capt. Yusuf on aircraft 5N-NCT for 1.4 hours.', style: TextStyle(color: NCATTheme.softText, height: 1.5)),
          SizedBox(height: 12),
          Text('AI Structured Entry: Dual flight session completed on landing approach, runway alignment, flare control and touchdown stability. Aircraft: 5N-NCT. Duration: 1.4 hours. Instructor: Capt. Yusuf. Status: pending instructor review.', style: TextStyle(color: NCATTheme.text, height: 1.5, fontWeight: FontWeight.w600)),
          SizedBox(height: 14),
          Wrap(spacing: 10, runSpacing: 10, children: [
            StatusChip('Flight logbook', color: NCATTheme.cyan),
            StatusChip('Missing: weather note', color: NCATTheme.gold),
            StatusChip('Pending instructor approval', color: NCATTheme.red),
          ]),
        ],
      ),
    );
  }
}

class _ApprovalQueue extends StatelessWidget {
  const _ApprovalQueue();

  @override
  Widget build(BuildContext context) {
    final entries = const [
      _Entry('Aisha M. Bala', 'Dual Flight', '5N-NCT', '1.4h', 'Capt. Yusuf', 'Pending'),
      _Entry('David Okoro', 'Workshop Practical', 'AME Lab', '2.0h', 'Engr. Musa', 'Missing Field'),
      _Entry('Fatima Sani', 'Simulator', 'SIM-B737', '1.5h', 'Capt. A. Musa', 'Approved'),
      _Entry('Kabir Usman', 'Safety Drill', 'Hangar 2', '1.0h', 'Safety Unit', 'Review'),
    ];

    return GlassCard(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Instructor Approval Queue', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
        const SizedBox(height: 8),
        const Text('AI prepares entries, checks completeness, then sends them to instructors and training office for validation.', style: TextStyle(color: NCATTheme.softText)),
        const SizedBox(height: 16),
        for (final entry in entries) _EntryRow(entry: entry),
      ]),
    );
  }
}

class _Entry {
  const _Entry(this.student, this.type, this.asset, this.duration, this.instructor, this.status);
  final String student;
  final String type;
  final String asset;
  final String duration;
  final String instructor;
  final String status;
}

class _EntryRow extends StatelessWidget {
  const _EntryRow({required this.entry});
  final _Entry entry;

  @override
  Widget build(BuildContext context) {
    final color = entry.status == 'Approved'
        ? NCATTheme.green
        : entry.status == 'Missing Field'
            ? NCATTheme.red
            : NCATTheme.gold;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .045),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: .10)),
      ),
      child: Row(children: [
        const Icon(Icons.assignment_turned_in_rounded, color: NCATTheme.cyan),
        const SizedBox(width: 12),
        Expanded(flex: 2, child: Text(entry.student, style: const TextStyle(fontWeight: FontWeight.w900))),
        Expanded(flex: 2, child: Text(entry.type, style: const TextStyle(color: NCATTheme.softText))),
        Expanded(child: Text(entry.asset, style: const TextStyle(color: NCATTheme.softText))),
        Expanded(child: Text(entry.duration, style: const TextStyle(color: NCATTheme.softText))),
        Expanded(flex: 2, child: Text(entry.instructor, style: const TextStyle(color: NCATTheme.softText))),
        StatusChip(entry.status, color: color),
      ]),
    );
  }
}

class _ValidationRules extends StatelessWidget {
  const _ValidationRules();

  @override
  Widget build(BuildContext context) {
    return const GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('AI Completeness & Integrity Checks', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          SizedBox(height: 10),
          Text('The logbook AI checks date, duration, instructor, aircraft or simulator ID, lesson objective, student reflection, safety observation and duplicate entries. Official approval remains with the instructor and training office.', style: TextStyle(color: NCATTheme.softText, height: 1.5)),
          SizedBox(height: 14),
          Wrap(spacing: 10, runSpacing: 10, children: [
            StatusChip('Missing-field checker'),
            StatusChip('Duplicate detection'),
            StatusChip('Training-hours match'),
            StatusChip('Instructor approval'),
            StatusChip('Training-office validation'),
          ]),
        ],
      ),
    );
  }
}
