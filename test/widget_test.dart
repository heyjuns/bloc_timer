import 'package:bloc_timer/timer_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Timer App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const TimerApp());

    expect(find.text('01:00'), findsOneWidget);
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);

    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pump();

    expect(find.byIcon(Icons.pause), findsOneWidget);
    expect(find.byIcon(Icons.replay), findsOneWidget);

    await tester.tap(find.byIcon(Icons.pause));
    await tester.pump();

    expect(find.byIcon(Icons.pause), findsNothing);

    await tester.tap(find.byIcon(Icons.replay));
    await tester.pump();

    expect(find.byIcon(Icons.replay), findsNothing);
  });
}
