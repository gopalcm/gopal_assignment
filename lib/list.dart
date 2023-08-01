import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ValueNotifier<int>> counterList =
        List.generate(100, (index) => ValueNotifier<int>(0));
    return Scaffold(
      body: ListView.builder(
        itemCount: counterList.length,
        itemBuilder: (context, index) => CounterItemWidget(
          counter: counterList[index],
          onTapPlus: () => counterList[index].value++,
        ),
      ),
    );
  }
}

class CounterItemWidget extends StatelessWidget {
  final ValueNotifier<int> counter;
  final VoidCallback onTapPlus;

  const CounterItemWidget({
    super.key,
    required this.counter,
    required this.onTapPlus,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          // Display the value of the ValueNotifier<int> using a ValueListenableBuilder.
          ValueListenableBuilder<int>(
            valueListenable: counter,
            builder: (context, value, _) => Text(value.toString()),
          ),
          MaterialButton(
            onPressed: onTapPlus,
            child: const Text("+"),
          ),
        ],
      ),
    );
  }
}
