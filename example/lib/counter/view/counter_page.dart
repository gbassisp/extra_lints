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
    return const Text('stateful widget is also caught by the lint');
  }
}

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

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
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    // expect_lint: avoid_string_literals_inside_widget
    return Text('$count', style: theme.textTheme.displayLarge);
  }
}
