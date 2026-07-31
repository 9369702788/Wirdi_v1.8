import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wirdi/main.dart';

void main() {
  testWidgets('WirdiApp smoke test initialization', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const WirdiApp());

    // Verify application root shell mounts correctly
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
