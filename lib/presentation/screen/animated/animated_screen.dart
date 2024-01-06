import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  Color getRandomColor () {

    final random = Random();
    final r = random.nextInt(257);
    final g = random.nextInt(257);
    final b = random.nextInt(257);

    return Color.fromRGBO(r, g, b, 1);
  }

  void changeShape() {

    final random = Random();

    width = random.nextInt(300) + 50;
    height = random.nextInt(300) + 50;
    color = getRandomColor();
    borderRadius = random.nextInt(100) + 10;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contenedor animado')
      ),

      body: GestureDetector(
        onTap: () => changeShape(),
        child: Center(
          child: AnimatedContainer(
            duration : const Duration(milliseconds: 400),
            curve: Curves.easeInOutCubic,
            alignment: Alignment.center,
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          )
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => changeShape(),
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}