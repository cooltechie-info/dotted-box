import 'package:flutter_test/flutter_test.dart';
import 'package:dotted_box/dotted_box.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Run test', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: DottedBox(
          height: 100,
          width: 100,
        ),
      ),
    ));

    expect(find.byType(DottedBox), findsOneWidget);
  });
}
