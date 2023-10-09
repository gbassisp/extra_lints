import 'package:bloc/bloc.dart';

// not_expect_lint: avoid_string_literals_inside_widget
const constString = 'a string';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
