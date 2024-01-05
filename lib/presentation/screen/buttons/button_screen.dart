import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Botones screen'),
        ),
        body: _ButtonsView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pop();
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ));
  }
}

class _ButtonsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            const ElevatedButton(
                onPressed: null, child: Text('Elevated disabled')),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.access_alarm_outlined),
                label: const Text('Elevated Icon')),
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.account_balance_wallet_rounded),
                label: const Text('Filled')),
            OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_a_photo_outlined),
                label: const Text('Outlined')),
            TextButton(onPressed: () {}, child: const Text('Text')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.ac_unit_rounded),
                label: const Text('Text')),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.access_alarm_outlined)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.zoom_out_rounded),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(colors.primary),
                    iconColor: MaterialStateProperty.all(Colors.white))),
            const CustomButton()
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Material(
      color: colors.primary,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text('data', style: TextStyle(color: Colors.white),)
      ),
    );
  }
}
