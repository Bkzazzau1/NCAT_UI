import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../data/demo_data.dart';
import '../widgets/glass_card.dart';
import '../widgets/progress_ring.dart';
import '../widgets/section_header.dart';
import '../widgets/status_chip.dart';

class FlightHistoryPage extends StatelessWidget {
  const FlightHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SectionHeader(
            icon: Icons.flight_rounded,
            title: 'Flight History Intelligence',
            subtitle: 'Aviation-specific AI for student flight hours, simulator time, aircraft use, instructor remarks and training readiness.',
            actionLabel: 'Analyze Flight Risk',
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 820;
              return isNarrow
                  ? Column(children: _topCards())
                  : Row(crossAxisAlignment: CrossAxisAlignment.start, children: _topCards(expanded: true));
            },
          ),
          const SizedBox(height: 18),
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Recent Flight & Simulator History', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
                const SizedBox(height: 14),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingTextStyle: const TextStyle(color: NCATTheme.softText, fontWeight: FontWeight.w800),
                    columns: const [
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('Aircraft/Simulator')),
                      DataColumn(label: Text('Type')),
                      DataColumn(label: Text('Duration')),
                      DataColumn(label: Text('Instructor')),
                      DataColumn(label: Text('Remark')),
                    ],
                    rows: flightHistory
                        .map((f) => DataRow(cells: [
                              DataCell(Text(f.date)),
                              DataCell(Text(f.aircraft)),
                              DataCell(StatusChip(f.type)),
                              DataCell(Text('${f.duration}h')),
                              DataCell(Text(f.instructor)),
                              DataCell(SizedBox(width: 320, child: Text(f.remark))),
                            ]))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _topCards({bool expanded = false}) {
    final cards = [
      GlassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('AI Flight Summary', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
            SizedBox(height: 12),
            Text(
              'Student has completed 42.5 aircraft hours, 8 simulator hours and 6 solo hours. AI detected a training gap and recommends one supervised refresher session before next solo authorization.',
              style: TextStyle(color: NCATTheme.softText, height: 1.5),
            ),
            SizedBox(height: 16),
            StatusChip('Medium Risk'),
          ],
        ),
      ),
      GlassCard(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            ProgressRing(value: .68, label: 'Training Complete', color: NCATTheme.cyan),
            ProgressRing(value: .84, label: 'Attendance', color: NCATTheme.green),
            ProgressRing(value: .42, label: 'Gap Risk', color: NCATTheme.red),
          ],
        ),
      ),
    ];
    if (!expanded) return cards.map((card) => Padding(padding: const EdgeInsets.only(bottom: 14), child: card)).toList();
    return [Expanded(child: cards[0]), const SizedBox(width: 14), Expanded(child: cards[1])];
  }
}
