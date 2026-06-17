import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_header.dart';
import '../widgets/status_chip.dart';

class SecurityReportsPage extends StatelessWidget {
  const SecurityReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        SectionHeader(
          icon: Icons.security_rounded,
          title: 'AI Security Reports System',
          subtitle:
              'Security incident reporting, safety alerts, access logs, CCTV observations, hostel incidents, practical lab safety and management briefings.',
          actionLabel: 'Generate security brief',
        ),
        SizedBox(height: 18),
        _SecuritySummary(),
        SizedBox(height: 14),
        _IncidentBoard(),
        SizedBox(height: 14),
        _SecurityControls(),
      ],
    );
  }
}

class _SecuritySummary extends StatelessWidget {
  const _SecuritySummary();

  @override
  Widget build(BuildContext context) {
    return const GlassCard(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('AI Security Intelligence Summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
        SizedBox(height: 10),
        Text('AI consolidates security reports from guards, hostels, labs, hangars, ICT access logs, CCTV observations and student incident reports. It classifies severity, assigns responsible units and prepares management security briefs.', style: TextStyle(color: NCATTheme.softText, height: 1.5)),
        SizedBox(height: 14),
        Wrap(spacing: 10, runSpacing: 10, children: [
          StatusChip('14 open reports', color: NCATTheme.gold),
          StatusChip('2 critical alerts', color: NCATTheme.red),
          StatusChip('9 resolved today', color: NCATTheme.green),
          StatusChip('CCTV review pending', color: NCATTheme.cyan),
        ]),
      ]),
    );
  }
}

class _IncidentBoard extends StatelessWidget {
  const _IncidentBoard();

  @override
  Widget build(BuildContext context) {
    final incidents = const [
      _Incident('Unauthorized lab access attempt', 'ICT + Security', 'Critical'),
      _Incident('Hostel block C night disturbance', 'Hostel + Welfare', 'Medium'),
      _Incident('Hangar 2 safety kit inspection overdue', 'Safety Unit', 'High'),
      _Incident('Lost student ID card report', 'Student Affairs', 'Low'),
      _Incident('CCTV blind spot near workshop gate', 'Security Unit', 'High'),
    ];

    return GlassCard(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Security Incident Board', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
        const SizedBox(height: 8),
        const Text('Every report is classified, assigned, monitored and included in audit-ready management reports.', style: TextStyle(color: NCATTheme.softText)),
        const SizedBox(height: 16),
        for (final incident in incidents) _IncidentRow(incident: incident),
      ]),
    );
  }
}

class _Incident {
  const _Incident(this.title, this.unit, this.severity);
  final String title;
  final String unit;
  final String severity;
}

class _IncidentRow extends StatelessWidget {
  const _IncidentRow({required this.incident});
  final _Incident incident;

  @override
  Widget build(BuildContext context) {
    final color = incident.severity == 'Critical' || incident.severity == 'High' ? NCATTheme.red : incident.severity == 'Medium' ? NCATTheme.gold : NCATTheme.green;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white.withValues(alpha: .045), borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.white.withValues(alpha: .10))),
      child: Row(children: [
        const Icon(Icons.report_rounded, color: NCATTheme.cyan),
        const SizedBox(width: 12),
        Expanded(flex: 3, child: Text(incident.title, style: const TextStyle(fontWeight: FontWeight.w900))),
        Expanded(flex: 2, child: Text(incident.unit, style: const TextStyle(color: NCATTheme.softText))),
        StatusChip(incident.severity, color: color),
      ]),
    );
  }
}

class _SecurityControls extends StatelessWidget {
  const _SecurityControls();

  @override
  Widget build(BuildContext context) {
    return const GlassCard(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Security Reporting Controls', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
        SizedBox(height: 10),
        Text('The security system supports incident reports, anonymous student reports, guard shift reports, CCTV review notes, access-log anomalies, safety inspection reports and automatic escalation for critical cases.', style: TextStyle(color: NCATTheme.softText, height: 1.5)),
        SizedBox(height: 14),
        Wrap(spacing: 10, runSpacing: 10, children: [
          StatusChip('Incident forms'),
          StatusChip('Anonymous reports'),
          StatusChip('CCTV notes'),
          StatusChip('Access log anomaly'),
          StatusChip('Critical escalation'),
          StatusChip('Rector security brief'),
        ]),
      ]),
    );
  }
}
