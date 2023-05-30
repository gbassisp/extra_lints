import 'package:example/app/app.dart';
import 'package:example/counter/counter.dart';
import 'package:example/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class NotAWidget {
  const NotAWidget(this.text);
  final String text;
}

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });

  group('linter', () {
    test('expect lint', () {
      // expect_lint: avoid_string_literals_inside_widget
      final w = Builder(builder: (_) => const Text('Counter'));

      const n = NotAWidget('text');

      // not_expect_lint: avoid_string_literals_inside_widget
      final a = Builder(
        builder: (context) => Text(
          context.l10n.counterAppBarTitle,
        ),
      );

      expect(a, isNotNull);
      expect(w, isNotNull);
    });
  });
}
