import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_inmutable/app/detail/counter/counter_state.dart';

class CounterWidget extends ConsumerStatefulWidget {
  const CounterWidget({super.key});
  final int initialValue = 0;
  @override
  ConsumerState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends ConsumerState<CounterWidget> {
  @override
  void initState() {
    ref.read(counterProvider(widget.initialValue).notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Counter: ${ref.watch(counterProvider(0)).value}'),
        Row(
          children: [
            ElevatedButton(
              onPressed: () => ref.read(counterProvider(0).notifier).increment(),
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () =>ref.read(counterProvider(0).notifier).decrement(),
              child: const Text('Decrease'),
            ),
            ElevatedButton(
              onPressed: () => ref.read(counterProvider(0).notifier).reset(),
              child: const Text('Reset'),
            ),
          ],
        )
      ],
    );
  }
}
