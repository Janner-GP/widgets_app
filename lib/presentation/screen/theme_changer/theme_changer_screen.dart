import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/providers.dart';

class ThemeChangeScreen extends ConsumerWidget {
  const ThemeChangeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Change Screen'),
        actions: [
          IconButton(
            icon:  Icon(isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            }
          ),
        ],
      ),
      body: _ThemeChangerView()
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorsListProvider);
    final int colorIndex = ref.watch(selectedColorProvider);
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];

        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color)),
          subtitle: Text('Este es el color ${color.value}'),
          activeColor: color,
          value: index,
          groupValue: colorIndex,
          onChanged: (value) {
            ref.read(selectedColorProvider.notifier).state = index;
          },
        );
      }
    );
  }
}