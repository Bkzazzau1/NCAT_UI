import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_header.dart';
import '../widgets/status_chip.dart';

class DocumentVaultPage extends StatelessWidget {
  const DocumentVaultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final folders = [
      ('Student Files', '12,880 docs', Icons.school_rounded, '184 incomplete'),
      ('Staff Files', '920 docs', Icons.people_alt_rounded, '12 due review'),
      (
        'Internal Memos',
        '1,438 docs',
        Icons.mark_email_read_rounded,
        'AI classified'
      ),
      (
        'Procurement',
        '644 docs',
        Icons.shopping_cart_rounded,
        '3 missing approvals'
      ),
      (
        'Maintenance Records',
        '811 docs',
        Icons.build_rounded,
        '18 active issues'
      ),
      (
        'Safety & Compliance',
        '390 docs',
        Icons.health_and_safety_rounded,
        '4 overdue'
      ),
      ('Meeting Minutes', '288 docs', Icons.groups_rounded, 'Searchable'),
      ('Audit Files', '172 docs', Icons.fact_check_rounded, 'Secure vault'),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SectionHeader(
            icon: Icons.inventory_2_rounded,
            title: 'Digital Document Vault',
            subtitle:
                'A secure AI-searchable archive for student records and non-project administrative files.',
            actionLabel: 'Upload Document',
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search_rounded),
              hintText:
                  'Ask AI to find student files, memos, procurement records, maintenance reports, safety documents...',
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.auto_awesome_rounded)),
            ),
          ),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, constraints) {
              final count = constraints.maxWidth > 1000
                  ? 4
                  : constraints.maxWidth > 680
                      ? 2
                      : 1;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: folders.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: count,
                  mainAxisExtent: 168,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                ),
                itemBuilder: (context, index) {
                  final folder = folders[index];
                  return GlassCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(folder.$3, color: NCATTheme.cyan, size: 30),
                            const Spacer(),
                            StatusChip(folder.$4),
                          ],
                        ),
                        const Spacer(),
                        Text(folder.$1,
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 17)),
                        const SizedBox(height: 5),
                        Text(folder.$2,
                            style: const TextStyle(color: NCATTheme.softText)),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 18),
          const GlassCard(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.psychology_alt_rounded, color: NCATTheme.cyan),
                SizedBox(width: 14),
                Expanded(
                  child: Text(
                    'AI can auto-classify uploaded files, detect duplicates, summarize long documents, identify missing attachments and connect records to the correct student, department, asset or workflow.',
                    style: TextStyle(height: 1.5, color: NCATTheme.softText),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
