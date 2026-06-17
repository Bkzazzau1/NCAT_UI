import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ncat_ai_flutter_demo/app/ncat_ai_app.dart';

void main() {
  testWidgets('renders the NCAT AI app shell', (tester) async {
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.binding.setSurfaceSize(const Size(1280, 900));
    await tester.pumpWidget(const NCATAIApp());

    expect(find.text('NCAT AI Infrastructure Platform'), findsOneWidget);
    expect(find.textContaining('Command Centre'), findsWidgets);
  });
}
