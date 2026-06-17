import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_header.dart';
import '../widgets/status_chip.dart';

class StudentServiceDeskPage extends StatelessWidget {
  const StudentServiceDeskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        SectionHeader(
          icon: Icons.support_agent_rounded,
          title: 'AI Student Service Desk',
          subtitle: 'Support centre for student requests, hostel issues, clearance, transcript, certificate, welfare and academic support.',
          actionLabel: 'Create ticket',
        ),
        SizedBox(height: 18),
        _DeskSummary(),
        SizedBox(height: 14),
        _TicketBoard(),
      ],
    );
  }
}

class _DeskSummary extends StatelessWidget {
  const _DeskSummary();

  @override
  Widget build(BuildContext context) {
    return const GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('AI Support Summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          SizedBox(height: 10),
          Text('AI classifies student requests, assigns the correct office, tracks response time, sends reminders and links every case to the student profile.', style: TextStyle(color: NCATTheme.softText, height: 1.5)),
          SizedBox(height: 14),
          Wrap(spacing: 10, runSpacing: 10, children: [
            StatusChip('312 open tickets', color: NCATTheme.cyan),
            StatusChip('41 urgent cases', color: NCATTheme.red),
            StatusChip('76 resolved today', color: NCATTheme.green),
            StatusChip('3.2h avg response', color: NCATTheme.gold),
          ]),
        ],
      ),
    );
  }
}

class _TicketBoard extends StatelessWidget {
  const _TicketBoard();

  @override
  Widget build(BuildContext context) {
    final tickets = const [
      _Ticket('Hostel clearance pending', 'Hostel + Bursary', 'Medium'),
      _Ticket('Transcript request verification', 'Registry', 'High'),
      _Ticket('Name correction request', 'Student Affairs', 'Low'),
      _Ticket('Workshop logbook approval delay', 'Training Office', 'High'),
      _Ticket('Academic support request', 'Academic Adviser', 'Medium'),
    ];

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Live Student Support Queue', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
          const SizedBox(height: 8),
          const Text('Each request is classified, assigned, tracked with SLA, and linked to the student record.', style: TextStyle(color: NCATTheme.softText)),
          const SizedBox(height: 16),
          for (final ticket in tickets) _TicketRow(ticket: ticket),
        ],
      ),
    );
  }
}

class _Ticket {
  const _Ticket(this.issue, this.office, this.priority);
  final String issue;
  final String office;
  final String priority;
}

class _TicketRow extends StatelessWidget {
  const _TicketRow({required this.ticket});
  final _Ticket ticket;

  @override
  Widget build(BuildContext context) {
    final color = ticket.priority == 'High' ? NCATTheme.red : ticket.priority == 'Medium' ? NCATTheme.gold : NCATTheme.green;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .045),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: .10)),
      ),
      child: Row(children: [
        const Icon(Icons.confirmation_number_rounded, color: NCATTheme.cyan),
        const SizedBox(width: 12),
        Expanded(flex: 3, child: Text(ticket.issue, style: const TextStyle(fontWeight: FontWeight.w800))),
        Expanded(flex: 2, child: Text(ticket.office, style: const TextStyle(color: NCATTheme.softText))),
        StatusChip(ticket.priority, color: color),
      ]),
    );
  }
}
