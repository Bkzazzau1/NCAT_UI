import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../models/demo_models.dart';

class SideNav extends StatelessWidget {
  const SideNav({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<NavItem> items;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.fromLTRB(20, 26, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .045),
        border: Border(
            right: BorderSide(color: Colors.white.withValues(alpha: .10))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                      colors: [NCATTheme.blue, NCATTheme.cyan]),
                  boxShadow: [
                    BoxShadow(
                        color: NCATTheme.cyan.withValues(alpha: .28),
                        blurRadius: 28)
                  ],
                ),
                child: const Icon(Icons.flight_takeoff_rounded,
                    color: Colors.white),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('NCAT AI',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w900)),
                    SizedBox(height: 2),
                    Text('Digital Command Centre',
                        style:
                            TextStyle(color: NCATTheme.softText, fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          Expanded(
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final item = items[index];
                final selected = index == selectedIndex;
                return InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () => onSelected(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 13),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient: selected
                          ? const LinearGradient(
                              colors: [Color(0xFF1B65D8), Color(0xFF18B7DC)])
                          : null,
                      color: selected ? null : Colors.transparent,
                      border: selected
                          ? null
                          : Border.all(
                              color: Colors.white.withValues(alpha: .05)),
                    ),
                    child: Row(
                      children: [
                        Icon(item.icon,
                            size: 20,
                            color:
                                selected ? Colors.white : NCATTheme.softText),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color:
                                  selected ? Colors.white : NCATTheme.softText,
                              fontWeight:
                                  selected ? FontWeight.w800 : FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: NCATTheme.gold.withValues(alpha: .10),
              border: Border.all(color: NCATTheme.gold.withValues(alpha: .22)),
            ),
            child: const Row(
              children: [
                Icon(Icons.verified_user_rounded, color: NCATTheme.gold),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Demo Mode: AI responses use safe mock data.',
                    style: TextStyle(fontSize: 12, color: NCATTheme.softText),
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
