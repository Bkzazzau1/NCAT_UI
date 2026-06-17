import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_header.dart';
import '../widgets/status_chip.dart';

class AiStudentManagementPage extends StatelessWidget {
  const AiStudentManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        SectionHeader(
          icon: Icons.psychology_alt_rounded,
          title: 'AI-Powered Student Management',
          subtitle:
              'A global-standard Student 360 layer for admissions, onboarding, records, welfare, learning, logbooks, compliance, and graduation readiness.',
          actionLabel: 'Run AI scan',
        ),
        SizedBox(height: 22),
        _HeroGrid(),
        SizedBox(height: 22),
        _LifecycleBoard(),
        SizedBox(height: 22),
        _CapabilityGrid(),
        SizedBox(height: 22),
        _InterventionQueue(),
        SizedBox(height: 22),
        _StudentMobileExperience(),
        SizedBox(height: 22),
        _GovernanceBox(),
      ],
    );
  }
}

class _HeroGrid extends StatelessWidget {
  const _HeroGrid();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth > 1180
            ? 4
            : constraints.maxWidth > 780
                ? 2
                : 1;
        final cards = const [
          _HeroMetric(
            title: 'Student 360 Profiles',
            value: '1,247',
            subtitle: 'Unified academic, training, welfare and file records',
            icon: Icons.badge_rounded,
            color: NCATTheme.cyan,
          ),
          _HeroMetric(
            title: 'AI Risk Interventions',
            value: '58',
            subtitle: 'Students needing attendance, finance or logbook support',
            icon: Icons.health_and_safety_rounded,
            color: NCATTheme.red,
          ),
          _HeroMetric(
            title: 'Service Requests',
            value: '312',
            subtitle: 'Clearance, transcript, hostel, ID and document requests',
            icon: Icons.support_agent_rounded,
            color: NCATTheme.gold,
          ),
          _HeroMetric(
            title: 'AI Handbook Answers',
            value: '4,892',
            subtitle: 'Policy-grounded student support interactions',
            icon: Icons.menu_book_rounded,
            color: NCATTheme.green,
          ),
        ];

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cards.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 164,
          ),
          itemBuilder: (context, index) => cards[index],
        );
      },
    );
  }
}

class _HeroMetric extends StatelessWidget {
  const _HeroMetric({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: .14),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: color.withValues(alpha: .38)),
                ),
                child: Icon(icon, color: color),
              ),
              const Spacer(),
              Icon(Icons.auto_awesome_rounded, color: color, size: 20),
            ],
          ),
          const Spacer(),
          Text(value,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1,
                  )),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
          const SizedBox(height: 4),
          Text(subtitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: NCATTheme.softText, fontSize: 12)),
        ],
      ),
    );
  }
}

class _LifecycleBoard extends StatelessWidget {
  const _LifecycleBoard();

  @override
  Widget build(BuildContext context) {
    final stages = [
      ('Application', 'AI eligibility + duplicate check', 'Complete'),
      ('Admission', 'Credential verification + offer workflow', 'Complete'),
      ('Registration', 'Missing file and payment readiness', 'Pending'),
      ('Learning', 'Attendance, grades and academic support', 'Active'),
      ('Training', 'Flight/simulator/workshop logbook tracking', 'Medium Risk'),
      ('Clearance', 'Bursary, hostel, library, registry and training office', 'Blocked'),
      ('Certification', 'Certificate/transcript readiness check', 'Not Ready'),
    ];

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Student Lifecycle Intelligence',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                        )),
              ),
              const StatusChip('Student 360 active', color: NCATTheme.cyan),
            ],
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              for (final stage in stages)
                _LifecycleStep(
                  title: stage.$1,
                  detail: stage.$2,
                  status: stage.$3,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LifecycleStep extends StatelessWidget {
  const _LifecycleStep({
    required this.title,
    required this.detail,
    required this.status,
  });

  final String title;
  final String detail;
  final String status;

  @override
  Widget build(BuildContext context) {
    final color = status.contains('Blocked') || status.contains('Risk') || status.contains('Not')
        ? NCATTheme.red
        : status.contains('Pending')
            ? NCATTheme.gold
            : NCATTheme.green;
    return Container(
      width: 230,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white.withValues(alpha: .055),
        border: Border.all(color: Colors.white.withValues(alpha: .12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w800)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(detail,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: NCATTheme.softText, fontSize: 12)),
          const SizedBox(height: 12),
          StatusChip(status, color: color),
        ],
      ),
    );
  }
}

class _CapabilityGrid extends StatelessWidget {
  const _CapabilityGrid();

  @override
  Widget build(BuildContext context) {
    final items = const [
      _Capability(
        icon: Icons.fact_check_rounded,
        title: 'AI Admission Screening',
        text: 'Checks eligibility, duplicate applications, name mismatch, missing credentials and weak uploads before human review.',
      ),
      _Capability(
        icon: Icons.folder_special_rounded,
        title: 'AI Missing File Control',
        text: 'Continuously compares required documents against each student file and assigns the responsible office.',
      ),
      _Capability(
        icon: Icons.timeline_rounded,
        title: 'Academic Risk Scoring',
        text: 'Combines attendance, results, finance, logbook, welfare and training delay signals into a clear risk score.',
      ),
      _Capability(
        icon: Icons.menu_book_rounded,
        title: 'AI Handbook Assistant',
        text: 'Answers student questions from approved NCAT handbook, circulars and policies with source references.',
      ),
      _Capability(
        icon: Icons.edit_note_rounded,
        title: 'AI Logbook Coach',
        text: 'Helps students structure flight, simulator and workshop entries, then routes them to instructors for approval.',
      ),
      _Capability(
        icon: Icons.support_agent_rounded,
        title: 'Student Service Desk',
        text: 'Tracks hostel, clearance, ID card, transcript, certificate, welfare and academic support requests in one queue.',
      ),
    ];

    return LayoutBuilder(builder: (context, constraints) {
      final columns = constraints.maxWidth > 1100
          ? 3
          : constraints.maxWidth > 720
              ? 2
              : 1;
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          mainAxisExtent: 174,
        ),
        itemBuilder: (context, index) => items[index],
      );
    });
  }
}

class _Capability extends StatelessWidget {
  const _Capability({required this.icon, required this.title, required this.text});
  final IconData icon;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: NCATTheme.cyan, size: 30),
          const SizedBox(height: 14),
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w900)),
          const SizedBox(height: 8),
          Text(text,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: NCATTheme.softText, height: 1.4)),
        ],
      ),
    );
  }
}

class _InterventionQueue extends StatelessWidget {
  const _InterventionQueue();

  @override
  Widget build(BuildContext context) {
    final rows = [
      ('NCAT/2026/PILOT/018', 'Flight gap + hostel clearance', 'Training Office', 'High'),
      ('NCAT/2026/AME/044', 'Workshop logbook missing Week 4', 'Instructor', 'Medium'),
      ('NCAT/2026/ATC/011', 'Attendance below approved threshold', 'Level Adviser', 'High'),
      ('NCAT/2026/OPS/027', 'Transcript request missing bursary confirmation', 'Registry', 'Pending'),
    ];

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('AI Intervention Queue',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w900)),
          const SizedBox(height: 8),
          const Text(
            'The system converts student risk signals into actionable tasks for the right office, with full audit trail.',
            style: TextStyle(color: NCATTheme.softText),
          ),
          const SizedBox(height: 16),
          for (final row in rows) ...[
            _QueueRow(regNo: row.$1, issue: row.$2, owner: row.$3, priority: row.$4),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}

class _QueueRow extends StatelessWidget {
  const _QueueRow({required this.regNo, required this.issue, required this.owner, required this.priority});
  final String regNo;
  final String issue;
  final String owner;
  final String priority;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .045),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: .10)),
      ),
      child: Row(
        children: [
          const Icon(Icons.person_pin_circle_rounded, color: NCATTheme.cyan),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: Text(regNo, style: const TextStyle(fontWeight: FontWeight.w800)),
          ),
          Expanded(flex: 3, child: Text(issue, style: const TextStyle(color: NCATTheme.softText))),
          Expanded(child: Text(owner, style: const TextStyle(color: NCATTheme.softText))),
          StatusChip(priority),
        ],
      ),
    );
  }
}

class _StudentMobileExperience extends StatelessWidget {
  const _StudentMobileExperience();

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 112,
            height: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(colors: [NCATTheme.panel2, NCATTheme.navy2]),
              border: Border.all(color: NCATTheme.cyan.withValues(alpha: .35)),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone_iphone_rounded, color: NCATTheme.cyan, size: 36),
                SizedBox(height: 10),
                Text('Student App', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w900)),
                SizedBox(height: 6),
                Text('AI + Offline Sync', textAlign: TextAlign.center, style: TextStyle(color: NCATTheme.softText, fontSize: 11)),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Premium Student Experience',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                SizedBox(height: 10),
                Text(
                  'Students get one app for handbook questions, academic assistance, smart notices, logbook filling, progress tracking, service requests, document uploads, payment status, hostel status, clearance and transcript requests.',
                  style: TextStyle(color: NCATTheme.softText, height: 1.5),
                ),
                SizedBox(height: 14),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    StatusChip('Voice logbook'),
                    StatusChip('Offline first'),
                    StatusChip('Policy AI'),
                    StatusChip('Academic coach'),
                    StatusChip('Smart reminders'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GovernanceBox extends StatelessWidget {
  const _GovernanceBox();

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            children: [
              Icon(Icons.verified_user_rounded, color: NCATTheme.green),
              SizedBox(width: 10),
              Text('AI Governance for Student Management',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'All AI decisions remain assistive. Final approvals stay with authorized NCAT officers. Every AI recommendation, file action, approval, rejection, logbook edit, result change and service request is recorded in the audit trail.',
            style: TextStyle(color: NCATTheme.softText, height: 1.5),
          ),
        ],
      ),
    );
  }
}
