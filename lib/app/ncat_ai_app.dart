import 'package:flutter/material.dart';

import '../widgets/responsive_shell.dart';
import 'theme.dart';

class NCATAIApp extends StatelessWidget {
  const NCATAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NCAT AI Demo',
      theme: NCATTheme.dark,
      home: const ResponsiveShell(),
    );
  }
}
