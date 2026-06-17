import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_header.dart';
import '../widgets/status_chip.dart';

class AIHandbookPage extends StatelessWidget {
  const AIHandbookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        SectionHeader(
          icon: Icons.menu_book_rounded,
          title: 'AI Handbook Knowledge Base',
          subtitle: 'Policy-grounded assistant for student rules, registration, training, hostel, clearance, exams and welfare questions.',
          actionLabel: 'Ask handbook AI',
        ),
        SizedBox(height: 18),
        _HandbookAnswerCard(),
        SizedBox(height: 14),
        _KnowledgeCategories(),
        SizedBox(height: 14),
        _SourceGuardrails(),
      ],
    );
  }
}

class _HandbookAnswerCard extends StatelessWidget {
  const _HandbookAnswerCard();

  @override
  Widget build(BuildContext context) {
    return const GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sample Question', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          SizedBox(height: 10),
          Text('What do I need before I can start practical training?', style: TextStyle(color: NCATTheme.text, fontWeight: FontWeight.w800)),
          SizedBox(height: 12),
          Text('AI Answer: Before practical training activation, the student file must show completed registration, verified documents, medical clearance, bursary confirmation, departmental approval and assigned training group. Any missing item is routed to the responsible office.', style: TextStyle(color: NCATTheme.softText, height: 1.5)),
          SizedBox(height: 14),
          Wrap(spacing: 10, runSpacing: 10, children: [
            StatusChip('Source: Registration Policy', color: NCATTheme.cyan),
            StatusChip('Source: Training Rules', color: NCATTheme.green),
            StatusChip('Human approval required', color: NCATTheme.gold),
          ]),
        ],
      ),
    );
  }
}

class _KnowledgeCategories extends StatelessWidget {
  const _KnowledgeCategories();

  @override
  Widget build(BuildContext context) {
    final items = const [
      _Category(Icons.app_registration_rounded, 'Registration', 'Documents, validation, activation and course registration.'),
      _Category(Icons.flight_takeoff_rounded, 'Training Rules', 'Flight, simulator, workshop and instructor approval rules.'),
      _Category(Icons.fact_check_rounded, 'Exams & Results', 'Attendance eligibility, assessments, results and appeals.'),
      _Category(Icons.home_work_rounded, 'Hostel & Welfare', 'Allocation, complaints, welfare and student support.'),
      _Category(Icons.verified_rounded, 'Clearance', 'Bursary, hostel, registry, library and training clearance.'),
      _Category(Icons.description_rounded, 'Transcript & Certificate', 'Requests, payment checks, verification and dispatch status.'),
    ];

    return LayoutBuilder(builder: (context, constraints) {
      final count = constraints.maxWidth > 1000 ? 3 : constraints.maxWidth > 650 ? 2 : 1;
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: count,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          mainAxisExtent: 150,
        ),
        itemBuilder: (context, index) => _CategoryCard(category: items[index]),
      );
    });
  }
}

class _Category {
  const _Category(this.icon, this.title, this.text);
  final IconData icon;
  final String title;
  final String text;
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({required this.category});
  final _Category category;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(category.icon, color: NCATTheme.cyan, size: 30),
          const SizedBox(height: 12),
          Text(category.title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900)),
          const SizedBox(height: 6),
          Text(category.text, style: const TextStyle(color: NCATTheme.softText, height: 1.35)),
        ],
      ),
    );
  }
}

class _SourceGuardrails extends StatelessWidget {
  const _SourceGuardrails();

  @override
  Widget build(BuildContext context) {
    return const GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('AI Safety & Source Guardrails', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          SizedBox(height: 10),
          Text('The handbook AI must only answer from approved NCAT documents. Every answer should show the source, confidence level and reminder that final decisions remain with authorized NCAT officers.', style: TextStyle(color: NCATTheme.softText, height: 1.5)),
          SizedBox(height: 14),
          Wrap(spacing: 10, runSpacing: 10, children: [
            StatusChip('Approved sources only'),
            StatusChip('Show citation'),
            StatusChip('No policy invention'),
            StatusChip('Escalate unclear cases'),
            StatusChip('Audit every answer'),
          ]),
        ],
      ),
    );
  }
}
