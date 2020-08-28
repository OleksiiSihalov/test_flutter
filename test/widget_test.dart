import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_flutter/main.dart';

void main() {
  testWidgets('Proper greeting test', (WidgetTester tester) async {
    await tester.pumpWidget(App());

    expect(find.text('Hey there!'), findsOneWidget);
    expect(find.text('Hi there!'), findsNothing);
  });

  testWidgets('Color changing test', (WidgetTester tester) async {
    await tester.pumpWidget(App());

    Container testContainer =
        tester.widget(find.byKey(Key('container'))) as Container;
    Color oldColor = testContainer.color;

    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    testContainer = tester.widget(find.byKey(Key('container'))) as Container;
    expect(testContainer.color, isNot(equals(oldColor)));
  });
}
