import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Progress Indicator'),
        ),
        body: _ProgressView());
  }
}

class _ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const SizedBox(height: 30),
        const Text('Circula Progress Indicator'),
        const SizedBox(height: 10),
        const CircularProgressIndicator(
          backgroundColor: Colors.grey,
        ),
        const SizedBox(height: 30),
        const Text('Circular and Linear Progress Indicator Controlled'),
        const SizedBox(height: 10),
        _CustomProgressIndicator()
      ],
    ));
  }
}

class _CustomProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value * 2) / 100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {

        final progressValue = snapshot.data ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircularProgressIndicator(
              value: progressValue, backgroundColor: Colors.grey, color: Colors.green
            ),
            const SizedBox(width: 20),
            Expanded(child: LinearProgressIndicator(value: progressValue))
          ]),
        );
      },
    );
  }
}
