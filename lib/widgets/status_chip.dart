import 'package:flutter/material.dart';

import '../app/theme.dart';

class StatusChip extends StatelessWidget {
  const StatusChip(this.label, {super.key, this.color});

  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final c = color ?? _colorFor(label);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: c.withOpacity(.14),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: c.withOpacity(.45)),
      ),
      child: Text(
        label,
        style: TextStyle(color: c, fontWeight: FontWeight.w700, fontSize: 12),
      ),
    );
  }

  Color _colorFor(String label) {
    final lower = label.toLowerCase();
    if (lower.contains('critical') || lower.contains('high') || lower.contains('overdue')) {
      return NCATTheme.red;
    }
    if (lower.contains('medium') || lower.contains('pending') || lower.contains('due')) {
      return NCATTheme.gold;
    }
    if (lower.contains('ready') || lower.contains('low') || lower.contains('approved')) {
      return NCATTheme.green;
    }
    return NCATTheme.cyan;
  }
}
