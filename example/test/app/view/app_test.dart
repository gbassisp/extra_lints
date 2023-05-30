import 'package:example/app/app.dart';
import 'package:example/counter/counter.dart';
import 'package:example/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class NotAWidget {
  const NotAWidget(this.text);
  final String text;
}

class One extends StatelessWidget {
  // expect_lint: avoid_string_literals_inside_widget
  const One({super.key, this.defaultValue = 'default'});

  // expect_lint: avoid_string_literals_inside_widget
  final defaultString = 'a string';
  final String defaultValue;

  @override
  Widget build(BuildContext context) {
    // expect_lint: avoid_string_literals_inside_widget
    const a = Text('Counter');

    return Row(
      children: [
        Text(defaultString),
        Text(defaultValue),
        a,
      ],
    );
  }
}

class Another extends StatefulWidget {
  // expect_lint: avoid_string_literals_inside_widget
  const Another({super.key, this.defaultValue = 'default'});

  final String defaultValue;

  @override
  State<Another> createState() => _AnotherState();
}

class _AnotherState extends State<Another> {
  // expect_lint: avoid_string_literals_inside_widget
  final defaultString = 'a string';

  @override
  Widget build(BuildContext context) {
    // expect_lint: avoid_string_literals_inside_widget
    const a = Text('Counter');

    return Row(
      children: [
        Text(defaultString),
        Text(widget.defaultValue),
        a,
      ],
    );
  }
}

const constString = 'a string';

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

      // not_expect_lint: avoid_string_literals_inside_widget
      const n = NotAWidget('text');

      // not_expect_lint: avoid_string_literals_inside_widget
      const widgetWithConstString = Text(constString);

      // not_expect_lint: avoid_string_literals_inside_widget
      final a = Builder(
        builder: (context) => Text(
          context.l10n.counterAppBarTitle,
        ),
      );

      Widget getWidget() {
        // expect_lint: avoid_string_literals_inside_widget
        return const Text('Counter');
      }

      expect(a, isNotNull);
      expect(w, isNotNull);
      expect(n, isNotNull);
      expect(widgetWithConstString, isNotNull);
      expect(getWidget(), isNotNull);
    });
  });
}
