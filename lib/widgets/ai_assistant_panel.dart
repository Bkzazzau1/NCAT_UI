import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../data/demo_data.dart';
import 'glass_card.dart';

class AIAssistantPanel extends StatefulWidget {
  const AIAssistantPanel({super.key, this.compact = false});

  final bool compact;

  @override
  State<AIAssistantPanel> createState() => _AIAssistantPanelState();
}

class _AIAssistantPanelState extends State<AIAssistantPanel> {
  final TextEditingController _controller = TextEditingController();
  String _answer =
      'I can search student records, missing files, flight history, infrastructure alerts, workflows, handbook rules, logbooks, academic support and NCAT reports.';

  void _ask(String prompt) {
    final lower = prompt.toLowerCase();
    setState(() {
      _controller.text = prompt;
      if (lower.contains('student') || lower.contains('risk')) {
        _answer =
            'Student 360: 58 students need intervention. Main causes are missing medical files, logbook delays, low attendance, unpaid fees, hostel clearance and training gaps.';
      } else if (lower.contains('handbook') || lower.contains('policy')) {
        _answer =
            'Handbook AI: students can ask approved NCAT policy questions. Answers should show the source document and never override official staff approval.';
      } else if (lower.contains('logbook')) {
        _answer =
            'Logbook AI: 37 entries are pending instructor approval. AI can improve student entries, detect missing fields and route them to the correct instructor.';
      } else if (lower.contains('academic')) {
        _answer =
            'Academic AI: 27 students have weak areas. Recommended support: revision questions, lecture note summaries, topic explanations and targeted study plans.';
      } else if (lower.contains('missing')) {
        _answer =
            'AI found 184 incomplete records. 43 are urgent: mostly medical clearance, bursary confirmation, hostel approval and one safety compliance file for Hangar 2.';
      } else if (lower.contains('rector') || lower.contains('report')) {
        _answer =
            'Management brief: 1,247 active students, 184 incomplete files, 58 student intervention cases, 27 training-risk students, 18 infrastructure alerts and 9 delayed result approvals.';
      } else if (lower.contains('flight')) {
        _answer =
            'Flight intelligence: 12 pilot students have training gaps above 14 days. One student has repeated landing approach remarks and should complete one simulator refresher before next solo.';
      } else if (lower.contains('maintenance') ||
          lower.contains('infrastructure')) {
        _answer =
            'Infrastructure alert: Simulator B needs inspection in 6 operating hours, Generator 2 shows repeated downtime, and Hangar 2 safety kit inspection is overdue.';
      } else if (lower.contains('approval')) {
        _answer =
            'Approval delay detected: Aircraft Maintenance result approval has remained with department for 6 days. AI recommends escalation to HoD office.';
      } else if (lower.contains('clearance')) {
        _answer =
            'Clearance check: 43 students are blocked. Main causes are bursary confirmation, hostel clearance, missing logbook approvals, and registry document verification.';
      } else {
        _answer =
            'AI recommendation: connect this request to NCAT data vault, student lifecycle records, workflows, aviation logbooks, handbook knowledge base and infrastructure asset registry.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                      colors: [NCATTheme.cyan, NCATTheme.blue]),
                ),
                child:
                    const Icon(Icons.auto_awesome_rounded, color: Colors.white),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ask NCAT AI',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 16)),
                    SizedBox(height: 2),
                    Text('Student and institutional intelligence copilot',
                        style:
                            TextStyle(color: NCATTheme.softText, fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: aiPrompts
                .take(widget.compact ? 3 : aiPrompts.length)
                .map((prompt) => ActionChip(
                      label: Text(prompt),
                      onPressed: () => _ask(prompt),
                      side: BorderSide(
                          color: Colors.white.withValues(alpha: .12)),
                      backgroundColor: Colors.white.withValues(alpha: .06),
                    ))
                .toList(),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            minLines: 1,
            maxLines: 2,
            decoration: InputDecoration(
              hintText: 'Ask about students, files, handbook, logbook...',
              suffixIcon: IconButton(
                icon: const Icon(Icons.send_rounded),
                onPressed: () => _ask(_controller.text),
              ),
            ),
            onSubmitted: _ask,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: NCATTheme.cyan.withValues(alpha: .08),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: NCATTheme.cyan.withValues(alpha: .18)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.psychology_alt_rounded, color: NCATTheme.cyan),
                const SizedBox(width: 12),
                Expanded(
                    child: Text(_answer, style: const TextStyle(height: 1.45))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
