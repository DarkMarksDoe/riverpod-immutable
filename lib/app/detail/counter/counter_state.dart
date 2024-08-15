import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterState {
  CounterState(this.value);
  int value;
}

final counterProvider = StateNotifierProvider.autoDispose
    .family<CounterController, CounterState, int>((ref, initialValue) {
  return CounterController(initialValue);
});

class CounterController extends StateNotifier<CounterState> {
  CounterController(int initialValue) : super(CounterState(initialValue));

  void increment() {
    state = CounterState(state.value + 1);
  }

  void decrement() {
    state = CounterState(state.value - 1);
  }

  void reset() {
    state = CounterState(0);
  }
}
