import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../widgets/glass_card.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.onContinue});

  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final roles = [
      ('Rector / Management', Icons.admin_panel_settings_rounded),
      ('Registrar', Icons.assignment_ind_rounded),
      ('Training Officer', Icons.flight_takeoff_rounded),
      ('Instructor / Lecturer', Icons.co_present_rounded),
      ('Bursary Officer', Icons.account_balance_wallet_rounded),
      ('ICT / Infrastructure', Icons.hub_rounded),
      ('Student', Icons.school_rounded),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                height: 86,
                width: 86,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(colors: [NCATTheme.blue, NCATTheme.cyan]),
                  boxShadow: [BoxShadow(color: NCATTheme.cyan.withOpacity(.38), blurRadius: 48)],
                ),
                child: const Icon(Icons.flight_takeoff_rounded, size: 40, color: Colors.white),
              ),
              const SizedBox(height: 22),
              Text(
                'NCAT AI Infrastructure Platform',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w900, letterSpacing: -1.2),
              ),
              const SizedBox(height: 10),
              const Text(
                'A premium AI-powered demo for student tracking, missing files, flight history, workflows, logbooks, administration and institutional infrastructure.',
                textAlign: TextAlign.center,
                style: TextStyle(color: NCATTheme.softText, height: 1.5),
              ),
              const SizedBox(height: 30),
              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  final crossAxisCount = width > 900 ? 4 : width > 600 ? 3 : 1;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: roles.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisExtent: 138,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 14,
                    ),
                    itemBuilder: (context, index) {
                      final role = roles[index];
                      return GlassCard(
                        onTap: onContinue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(role.$2, color: NCATTheme.cyan, size: 30),
                            const Spacer(),
                            Text(role.$1, style: const TextStyle(fontWeight: FontWeight.w800)),
                            const SizedBox(height: 6),
                            const Text('Open AI workspace', style: TextStyle(color: NCATTheme.softText, fontSize: 12)),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 26),
              FilledButton.icon(
                onPressed: onContinue,
                icon: const Icon(Icons.auto_awesome_rounded),
                label: const Text('Enter AI Command Centre'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                  textStyle: const TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
