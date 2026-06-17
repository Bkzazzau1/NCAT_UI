import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_header.dart';
import '../widgets/status_chip.dart';

class StudentAIAppPage extends StatelessWidget {
  const StudentAIAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      ('AI Handbook', 'Ask questions from NCAT-approved rules, policies and student handbook.', Icons.menu_book_rounded, 'Source-based'),
      ('Logbook Assistant', 'Fill flight, simulator and workshop logbooks with AI guidance.', Icons.edit_note_rounded, 'Instructor approval'),
      ('Academic Assistant', 'Explain topics, summarize notes, generate revision questions and study plans.', Icons.psychology_rounded, 'Personalized'),
      ('My Progress', 'Track attendance, training hours, missing files, clearance and academic risk.', Icons.query_stats_rounded, 'Live tracker'),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SectionHeader(
            icon: Icons.menu_book_rounded,
            title: 'AI Student Handbook, Logbook & Academic Assistant',
            subtitle: 'A student-facing app for approved policy answers, logbook filling, training support and academic help.',
            actionLabel: 'Open Student App',
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final count = constraints.maxWidth > 1000 ? 4 : constraints.maxWidth > 680 ? 2 : 1;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: features.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: count,
                  mainAxisExtent: 205,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                ),
                itemBuilder: (context, index) {
                  final f = features[index];
                  return GlassCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(f.$3, color: NCATTheme.cyan, size: 32),
                            const Spacer(),
                            StatusChip(f.$4),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Text(f.$1, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
                        const SizedBox(height: 8),
                        Text(f.$2, style: const TextStyle(color: NCATTheme.softText, height: 1.45)),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 900;
              final content = [
                Expanded(child: _HandbookDemo()),
                const SizedBox(width: 14),
                Expanded(child: _LogbookDemo()),
              ];
              if (isNarrow) {
                return Column(children: [const _HandbookDemo(), const SizedBox(height: 14), const _LogbookDemo()]);
              }
              return Row(crossAxisAlignment: CrossAxisAlignment.start, children: content);
            },
          ),
        ],
      ),
    );
  }
}

class _HandbookDemo extends StatelessWidget {
  const _HandbookDemo();

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Ask the Handbook AI', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
          const SizedBox(height: 12),
          const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search_rounded),
              hintText: 'What documents do I need for registration?',
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'AI Answer: You need your admission letter, verified credentials, medical clearance, payment evidence and departmental registration approval before training activation. Source: Student Registration Policy.',
            style: TextStyle(color: NCATTheme.softText, height: 1.5),
          ),
        ],
      ),
    );
  }
}

class _LogbookDemo extends StatelessWidget {
  const _LogbookDemo();

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('AI Logbook Filling', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
          const SizedBox(height: 12),
          const TextField(
            minLines: 3,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Today we practiced landing...',
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'AI Improved Entry: Today’s session focused on landing approach, runway alignment, flare control and touchdown stability under instructor supervision. Pending instructor review.',
            style: TextStyle(color: NCATTheme.softText, height: 1.5),
          ),
          const SizedBox(height: 12),
          const StatusChip('Pending Instructor Approval'),
        ],
      ),
    );
  }
}
