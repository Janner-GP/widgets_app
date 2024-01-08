import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/providers.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final clicCounter = ref.watch(counterProvider);
    final isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon:  const Icon(Icons.dark_mode_outlined),
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
            }
          ),
        ],
      ),
      body: Center(
        child: Text('Valor: $clicCounter', style:  const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read( counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      )
    );
  }
}