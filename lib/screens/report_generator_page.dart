import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_header.dart';
import '../widgets/status_chip.dart';

class ReportGeneratorPage extends StatelessWidget {
  const ReportGeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final reports = [
      'Rector Weekly Briefing',
      'Missing Student File Report',
      'Flight Training Risk Report',
      'Infrastructure Maintenance Report',
      'Clearance Readiness Report',
      'Bursary Payment Exception Report',
      'Result Approval Delay Report',
      'Hostel & Welfare Issue Report',
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SectionHeader(
            icon: Icons.summarize_rounded,
            title: 'AI Report Generator',
            subtitle: 'Generate management-ready reports from student records, workflows, files, flight history and infrastructure data.',
            actionLabel: 'Export PDF',
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 980;
              return isNarrow
                  ? Column(children: [_ReportPrompt(reports: reports), const SizedBox(height: 14), const _ReportPreview()])
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 4, child: _ReportPrompt(reports: reports)),
                        const SizedBox(width: 14),
                        const Expanded(flex: 5, child: _ReportPreview()),
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }
}

class _ReportPrompt extends StatelessWidget {
  const _ReportPrompt({required this.reports});

  final List<String> reports;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Choose Report Type', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
          const SizedBox(height: 14),
          ...reports.map((report) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.05),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(.08)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.article_rounded, color: NCATTheme.cyan, size: 20),
                    const SizedBox(width: 10),
                    Expanded(child: Text(report, style: const TextStyle(fontWeight: FontWeight.w700))),
                    const Icon(Icons.chevron_right_rounded, color: NCATTheme.softText),
                  ],
                ),
              )),
          const SizedBox(height: 12),
          const TextField(
            minLines: 3,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Example: Generate a one-page report for the Rector covering missing files, flight risks and infrastructure alerts.',
            ),
          ),
          const SizedBox(height: 14),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.auto_awesome_rounded),
            label: const Text('Generate AI Report'),
          ),
        ],
      ),
    );
  }
}

class _ReportPreview extends StatelessWidget {
  const _ReportPreview();

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            children: [
              Icon(Icons.auto_awesome_rounded, color: NCATTheme.cyan),
              SizedBox(width: 10),
              Text('AI Generated Preview', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
              Spacer(),
              StatusChip('Draft'),
            ],
          ),
          SizedBox(height: 18),
          Text('NCAT Management Intelligence Brief', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
          SizedBox(height: 8),
          Text('This week, the platform monitored student records, administrative files, flight training, workflows and infrastructure assets across NCAT.', style: TextStyle(color: NCATTheme.softText, height: 1.5)),
          SizedBox(height: 18),
          _ReportLine(title: 'Student Records', value: '184 incomplete files detected; 43 require urgent action.'),
          _ReportLine(title: 'Flight Training', value: '12 students have flight gaps above 14 days; simulator refresher recommended.'),
          _ReportLine(title: 'Infrastructure', value: '18 maintenance issues active; Simulator B and Generator 2 require attention.'),
          _ReportLine(title: 'Approvals', value: '9 result approvals are delayed; HoD escalation recommended.'),
          _ReportLine(title: 'AI Recommendation', value: 'Prioritize medical/bursary clearance, simulator inspection and delayed result approval workflow.'),
        ],
      ),
    );
  }
}

class _ReportLine extends StatelessWidget {
  const _ReportLine({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_rounded, color: NCATTheme.green, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: NCATTheme.text, height: 1.45),
                children: [
                  TextSpan(text: '$title: ', style: const TextStyle(fontWeight: FontWeight.w900)),
                  TextSpan(text: value, style: const TextStyle(color: NCATTheme.softText)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
