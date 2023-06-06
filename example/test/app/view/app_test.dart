// ignore_for_file: avoid_field_initializers_in_const_classes

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
  const One({Key? key, this.defaultValue = 'default'}) : super(key: key);

  // expect_lint: avoid_string_literals_inside_widget
  final defaultString = 'a string';

  // expect_lint: avoid_string_literals_inside_widget
  static const staticFinal = 'a string';

  // expect_lint: avoid_string_literals_inside_widget
  static const staticConst = 'a string';

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
  const Another({Key? key, this.defaultValue = 'default'}) : super(key: key);

  final String defaultValue;
  // expect_lint: avoid_string_literals_inside_widget
  final outsideState = 'a string';

  @override
  State<Another> createState() => _AnotherState();
}

class _AnotherState extends State<Another> {
  // expect_lint: avoid_string_literals_inside_widget
  final insideState = 'a string';

  @override
  Widget build(BuildContext context) {
    // expect_lint: avoid_string_literals_inside_widget
    const a = Text('Counter');

    return Row(
      children: [
        Text(insideState),
        Text(widget.outsideState),
        Text(widget.defaultValue),
        a,
      ],
    );
  }
}

// not_expect_lint: avoid_string_literals_inside_widget
const constString = 'a string';

void main() {
  // not_expect_lint: avoid_string_literals_inside_widget
  group('App', () {
    // not_expect_lint: avoid_string_literals_inside_widget
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });

  // not_expect_lint: avoid_string_literals_inside_widget
  group('linter', () {
    // not_expect_lint: avoid_string_literals_inside_widget
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
