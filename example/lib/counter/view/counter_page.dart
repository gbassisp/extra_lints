// ignore_for_file: prefer_if_elements_to_conditional_expressions

import 'package:example/counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class SomeStatefulWidget extends StatefulWidget {
  const SomeStatefulWidget({Key? key}) : super(key: key);

  @override
  State<SomeStatefulWidget> createState() => _SomeStatefulWidgetState();
}

class _SomeStatefulWidgetState extends State<SomeStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    // expect_lint: avoid_string_literals_inside_widget
    return const Text('nasty string literals will not support l10n!');
  }
}

class CounterView extends StatelessWidget {
  const CounterView({Key? key, this.enumCase = AnotherTest.a})
      : super(key: key);

  final AnotherTest enumCase;
  @override
  Widget build(BuildContext context) {
    // expect_lint: avoid_string_literals_inside_widget
    const a = 'another literal that should raise';
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          // expect_lint: avoid_string_literals_inside_widget
          'A string literal that should raise a warning',
        ),
      ),
      body: const Center(child: Text(a)),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increment(),
            child: const Icon(Icons.add),
          ),
          // enums should always be exhaustively tested;
          // perhaps create an extension method instead of doing this:

          // expect_lint: avoid_if_with_enum
          if (enumCase == AnotherTest.a)
            const SizedBox(height: 8)
          else
            const SizedBox(height: 10),

          // expect_lint: avoid_if_with_enum
          enumCase == AnotherTest.a
              ? const SizedBox(height: 8)
              : const SizedBox(height: 10),

          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

enum AnotherTest { a, b }

class CounterText extends StatelessWidget {
  const CounterText({Key? key, this.deprecatedParam})
      :
        // this is a test case, assertions can have string on description
        // unsure about condition (should be an enum)
        assert(
          deprecatedParam != 'condition should be an enum',
          // not_expect_lint: avoid_string_literals_inside_widget
          'assertion reason is okay, it only shows on debugging',
        ),
        super(key: key);

  final String? deprecatedParam;

  @override
  Widget build(BuildContext context) {
    // this is a test case, assertions can have string on description
    // unsure about condition (should be an enum)
    assert(
      deprecatedParam != 'condition should be an enum',
      // not_expect_lint: avoid_string_literals_inside_widget
      'assertion reason is okay, it only shows on debugging',
    );

    // expect_lint: avoid_string_literals_inside_widget
    const _ = 'asd';

    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    // expect_lint: avoid_string_literals_inside_widget
    return Text('$count', style: theme.textTheme.displayLarge);
  }
}
