import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloWorld = Provider((ref) => "Hello World!");

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorld);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Example"),
        ),
        body: Center(
          child: Text(value),
        ),
      ),
    );
  }
}
