import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/service/riverprovider.dart';

class Counterpage extends ConsumerWidget {
  const Counterpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Page"), 
        actions: [
          IconButton(
            onPressed: () {
              ref.invalidate(counterProvider);
            },
            icon: const Icon(Icons.refresh)
          ),
        ],
      ),
      body: Center(
        child: Text(
          counter.toString(),
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).state++;
          },
          child: const Icon(Icons.add)),
    );
  }
}
