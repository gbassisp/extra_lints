import 'package:bloc/bloc.dart';

// not_expect_lint: avoid_string_literals_inside_widget
const constString = 'a string';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  // the following examples are test cases to enfore using switch
  // statements on enum;
  // dart has exhaustive_cases rule to ensure enum logic is compile safe

  bool badConditionalOnEnum(TestCase example) {
    // expect_lint: avoid_if_with_enum
    if (example == TestCase.a) {
      return true;
    } else {
      return false;
    }
  }

  bool goodConditionalOnEnum(TestCase example) {
    // not_expect_lint: avoid_if_with_enum
    switch (example) {
      case TestCase.a:
        return true;
      case TestCase.b:
        return true;
    }
  }
}

enum TestCase {
  a,
  b,
}
