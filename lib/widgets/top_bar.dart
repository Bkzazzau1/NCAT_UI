import 'package:flutter/material.dart';

import '../app/theme.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.title,
    required this.onMenu,
  });

  final String title;
  final VoidCallback onMenu;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 900;
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 18, 24, 0),
      child: Row(
        children: [
          if (isMobile)
            IconButton.filledTonal(
              onPressed: onMenu,
              icon: const Icon(Icons.menu_rounded),
            ),
          if (isMobile) const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              color: Colors.white.withValues(alpha: .06),
              border: Border.all(color: Colors.white.withValues(alpha: .10)),
            ),
            child: const Row(
              children: [
                Icon(Icons.circle, color: NCATTheme.green, size: 10),
                SizedBox(width: 8),
                Text('AI Online',
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          const CircleAvatar(
            backgroundColor: NCATTheme.panel2,
            child: Icon(Icons.person_rounded, color: NCATTheme.cyan),
          ),
        ],
      ),
    );
  }
}
