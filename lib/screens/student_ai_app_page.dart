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
          subtitle:
              'Premium student intelligence for records, files, attendance, training, logbooks, service requests, clearance and academic support.',
          actionLabel: 'Run AI scan',
        ),
        SizedBox(height: 18),
        _StudentKpiStrip(),
        SizedBox(height: 14),
        _StudentSummaryCard(),
        SizedBox(height: 14),
        _StudentListCard(),
        SizedBox(height: 14),
        _StudentToolsCard(),
      ],
    );
  }
}

class _StudentKpiStrip extends StatelessWidget {
  const _StudentKpiStrip();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: const [
        _KpiPill(label: 'Active Students', value: '1,247', icon: Icons.school_rounded, color: NCATTheme.cyan),
        _KpiPill(label: 'AI Risk Cases', value: '58', icon: Icons.warning_rounded, color: NCATTheme.red),
        _KpiPill(label: 'Pending Logbooks', value: '37', icon: Icons.edit_note_rounded, color: NCATTheme.gold),
        _KpiPill(label: 'Ready for Clearance', value: '126', icon: Icons.verified_rounded, color: NCATTheme.green),
      ],
    );
  }
}

class _KpiPill extends StatelessWidget {
  const _KpiPill({required this.label, required this.value, required this.icon, required this.color});
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: GlassCard(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                  Text(label, style: const TextStyle(color: NCATTheme.softText, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StudentSummaryCard extends StatelessWidget {
  const _StudentSummaryCard();

  @override
  Widget build(BuildContext context) {
    return const GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Student 360 Summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          SizedBox(height: 10),
          Text(
            'AI summarizes each student record, shows pending actions, recommends the next office to act, and keeps staff approvals under full human control.',
            style: TextStyle(color: NCATTheme.softText, height: 1.5),
          ),
          SizedBox(height: 14),
          Wrap(spacing: 10, runSpacing: 10, children: [
            StatusChip('Attendance 84%', color: NCATTheme.green),
            StatusChip('File 78%', color: NCATTheme.gold),
            StatusChip('Training pending', color: NCATTheme.gold),
            StatusChip('Action needed', color: NCATTheme.red),
          ]),
        ],
      ),
    );
  }
}

class _StudentListCard extends StatelessWidget {
  const _StudentListCard();

  @override
  Widget build(BuildContext context) {
    final students = const [
      _StudentRowData('NCAT/2026/PILOT/018', 'Aisha M. Bala', 'Pilot Course', '62%', '78%', '84%', '3 pending', 'Hostel + Medical', 'Medium'),
      _StudentRowData('NCAT/2026/AME/044', 'David Okoro', 'Aircraft Maintenance', '71%', '64%', '76%', 'Week 4 missing', 'Training Office', 'High'),
      _StudentRowData('NCAT/2026/ATC/011', 'Fatima Sani', 'Air Traffic Control', '54%', '91%', '69%', 'Complete', 'Level Adviser', 'High'),
      _StudentRowData('NCAT/2026/OPS/027', 'Kabir Usman', 'Aviation Operations', '28%', '96%', '93%', 'Complete', 'Registry', 'Low'),
    ];

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('AI Student Watchlist',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
              ),
              const StatusChip('Live risk engine', color: NCATTheme.cyan),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'A management-ready list showing each student risk level, file completion, attendance, logbook status and next office responsible.',
            style: TextStyle(color: NCATTheme.softText),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                const _StudentTableHeader(),
                for (final student in students) _StudentTableRow(student: student),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StudentRowData {
  const _StudentRowData(this.regNo, this.name, this.programme, this.risk, this.file, this.attendance, this.logbook, this.nextOffice, this.priority);
  final String regNo;
  final String name;
  final String programme;
  final String risk;
  final String file;
  final String attendance;
  final String logbook;
  final String nextOffice;
  final String priority;
}

class _StudentTableHeader extends StatelessWidget {
  const _StudentTableHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1040,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: NCATTheme.cyan.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: NCATTheme.cyan.withValues(alpha: .18)),
      ),
      child: const Row(children: [
        _Cell('Student', flex: 3, header: true),
        _Cell('Programme', flex: 2, header: true),
        _Cell('Risk', header: true),
        _Cell('File', header: true),
        _Cell('Attendance', header: true),
        _Cell('Logbook', flex: 2, header: true),
        _Cell('Next Office', flex: 2, header: true),
        _Cell('Priority', header: true),
      ]),
    );
  }
}

class _StudentTableRow extends StatelessWidget {
  const _StudentTableRow({required this.student});
  final _StudentRowData student;

  @override
  Widget build(BuildContext context) {
    final color = student.priority == 'High'
        ? NCATTheme.red
        : student.priority == 'Medium'
            ? NCATTheme.gold
            : NCATTheme.green;

    return Container(
      width: 1040,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .045),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: .10)),
      ),
      child: Row(children: [
        Expanded(
          flex: 3,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(student.name, style: const TextStyle(fontWeight: FontWeight.w900)),
            const SizedBox(height: 3),
            Text(student.regNo, style: const TextStyle(color: NCATTheme.softText, fontSize: 12)),
          ]),
        ),
        _Cell(student.programme, flex: 2),
        _Cell(student.risk),
        _Cell(student.file),
        _Cell(student.attendance),
        _Cell(student.logbook, flex: 2),
        _Cell(student.nextOffice, flex: 2),
        Expanded(child: StatusChip(student.priority, color: color)),
      ]),
    );
  }
}

class _Cell extends StatelessWidget {
  const _Cell(this.text, {this.flex = 1, this.header = false});
  final String text;
  final int flex;
  final bool header;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: header ? NCATTheme.text : NCATTheme.softText,
          fontSize: header ? 12 : 13,
          fontWeight: header ? FontWeight.w900 : FontWeight.w600,
        ),
      ),
    );
  }
}

class _StudentToolsCard extends StatelessWidget {
  const _StudentToolsCard();

  @override
  Widget build(BuildContext context) {
    return const GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Student App AI Tools', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          SizedBox(height: 10),
          Text(
            'Handbook AI answers approved policy questions. Logbook AI helps students structure flight, simulator and workshop entries before instructor approval. Academic AI explains topics, creates revision questions and recommends weak areas.',
            style: TextStyle(color: NCATTheme.softText, height: 1.5),
          ),
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
    );
  }
}
