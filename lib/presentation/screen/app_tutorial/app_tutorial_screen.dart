import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlidesInfo {
  final String title;
  final String caption;
  final String image;

  SlidesInfo(this.title, this.caption, this.image);
}

final slides = <SlidesInfo>[
  SlidesInfo(
      'Busca la comida',
      'Debes buscar las comida que vas a degustar en nuestra app',
      'assets/images/1.png'),
  SlidesInfo(
      'Pide la comida',
      'Debes pedir las comida que vas a degustar en nuestra app',
      'assets/images/2.png'),
  SlidesInfo(
      'Disfruta de la comida',
      'Disfrurta de la comida que llega hasta la puerta de tu casa',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState(){
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if ( !endReached && page >= ( slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
        PageView(
          controller: pageViewController,
          physics: const BouncingScrollPhysics(),
          children: slides.map((slide) => _Slide(
                  title: slide.title,
                  caption: slide.caption,
                  image: slide.image,
                )).toList()
        ),
        Positioned(
          right: 20,
          top: 50,
          child: TextButton(
            child: const Text('Omitir tutorial'),
            onPressed: () => context.pop(),
          ),
        ),
        endReached ?
          Positioned(
            bottom: 30,
            right: 20,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                onPressed: () => context.pop(),
                child: const Text('Comenzar'),
              ),
            )
          )
          : const SizedBox()
      ])
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String image;

  const _Slide(
      {required this.title, required this.caption, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(image)),
          const SizedBox(height: 40),
          Text(title,
              style:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Text(caption, style: const TextStyle(fontSize: 15)),
        ],
      )),
    );
  }
}
