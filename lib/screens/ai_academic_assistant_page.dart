import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_header.dart';
import '../widgets/status_chip.dart';

class AIAcademicAssistantPage extends StatelessWidget {
  const AIAcademicAssistantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        SectionHeader(
          icon: Icons.school_rounded,
          title: 'AI Academic Assistant',
          subtitle: 'Personal learning support for lecture notes, topic explanation, revision questions, weak-area detection and study planning.',
          actionLabel: 'Generate study plan',
        ),
        SizedBox(height: 18),
        _LearningSummary(),
        SizedBox(height: 14),
        _AcademicToolsGrid(),
        SizedBox(height: 14),
        _RevisionPreview(),
        SizedBox(height: 14),
        _WeakAreaCoach(),
      ],
    );
  }
}

class _LearningSummary extends StatelessWidget {
  const _LearningSummary();

  @override
  Widget build(BuildContext context) {
    return const GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Personal Academic AI Summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          SizedBox(height: 10),
          Text('AI reviewed attendance, recent assessment scores and study activity. Recommended focus: Aircraft Navigation, Aviation Safety Procedures and Radio Communication discipline.', style: TextStyle(color: NCATTheme.softText, height: 1.5)),
          SizedBox(height: 14),
          Wrap(spacing: 10, runSpacing: 10, children: [
            StatusChip('Study risk: Medium', color: NCATTheme.gold),
            StatusChip('3 weak topics', color: NCATTheme.red),
            StatusChip('12 revision questions ready', color: NCATTheme.cyan),
            StatusChip('7-day plan generated', color: NCATTheme.green),
          ]),
        ],
      ),
    );
  }
}

class _AcademicToolsGrid extends StatelessWidget {
  const _AcademicToolsGrid();

  @override
  Widget build(BuildContext context) {
    final tools = const [
      _Tool(Icons.notes_rounded, 'Lecture Note Summary', 'AI summarizes approved lecture notes into key points and action items.'),
      _Tool(Icons.quiz_rounded, 'Revision Questions', 'Generate objective, short-answer and scenario-based revision questions.'),
      _Tool(Icons.psychology_rounded, 'Topic Explanation', 'Explain aviation topics in simple language with practical examples.'),
      _Tool(Icons.track_changes_rounded, 'Weak-Area Detection', 'Detect low performance patterns and recommend focused learning tasks.'),
      _Tool(Icons.calendar_month_rounded, 'Study Plan', 'Create weekly study plans based on timetable, assessments and weak areas.'),
      _Tool(Icons.record_voice_over_rounded, 'Voice Learning', 'Students can ask academic questions by voice and receive guided answers.'),
    ];

    return LayoutBuilder(builder: (context, constraints) {
      final count = constraints.maxWidth > 1000 ? 3 : constraints.maxWidth > 650 ? 2 : 1;
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: tools.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: count,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          mainAxisExtent: 158,
        ),
        itemBuilder: (context, index) => _ToolCard(tool: tools[index]),
      );
    });
  }
}

class _Tool {
  const _Tool(this.icon, this.title, this.text);
  final IconData icon;
  final String title;
  final String text;
}

class _ToolCard extends StatelessWidget {
  const _ToolCard({required this.tool});
  final _Tool tool;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(tool.icon, color: NCATTheme.cyan, size: 30),
          const SizedBox(height: 12),
          Text(tool.title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900)),
          const SizedBox(height: 6),
          Text(tool.text, style: const TextStyle(color: NCATTheme.softText, height: 1.35)),
        ],
      ),
    );
  }
}

class _RevisionPreview extends StatelessWidget {
  const _RevisionPreview();

  @override
  Widget build(BuildContext context) {
    return const GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('AI Revision Preview', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          SizedBox(height: 10),
          Text('Generated from approved class material: Explain the difference between heading and bearing. List three safety checks before simulator session. Describe what an instructor should verify before approving a logbook entry.', style: TextStyle(color: NCATTheme.softText, height: 1.5)),
          SizedBox(height: 14),
          Wrap(spacing: 10, runSpacing: 10, children: [
            StatusChip('Objective questions'),
            StatusChip('Short answers'),
            StatusChip('Scenario practice'),
            StatusChip('Instructor review'),
          ]),
        ],
      ),
    );
  }
}

class _WeakAreaCoach extends StatelessWidget {
  const _WeakAreaCoach();

  @override
  Widget build(BuildContext context) {
    return const GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Weak-Area Coach', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          SizedBox(height: 10),
          Text('AI does not replace lecturers. It supports students with learning guidance while lecturers and instructors remain responsible for assessment, approval and academic decisions.', style: TextStyle(color: NCATTheme.softText, height: 1.5)),
          SizedBox(height: 14),
          Wrap(spacing: 10, runSpacing: 10, children: [
            StatusChip('Lecturer controlled'),
            StatusChip('Approved materials only'),
            StatusChip('No exam leakage'),
            StatusChip('Audit learning activity'),
          ]),
        ],
      ),
    );
  }
}
