import 'package:flutter/material.dart';

const cardData = <Map<String, dynamic>> {
  {'elevation':0.6, 'label': 'Elevation 0.4'},
  {'elevation':1.2, 'label': 'Elevation 0.6'},
  {'elevation':1.4, 'label': 'Elevation 0.8'},
  {'elevation':1.8, 'label': 'Elevation 1.0'},
  {'elevation':2.0, 'label': 'Elevation 1.2'},
};


class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarjetas screen'),
      ),
      body: _CardsView()
    );
  }
}

class _CardsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cardData.map(
            ( card ) => _CardType1(elevation: card['elevation'], label: card['label'],)
          ),
          ...cardData.map(
            ( card ) => _CardType2(elevation: card['elevation'], label: card['label'],)
          ),
           ...cardData.map(
            ( card ) => _CardType3(elevation: card['elevation'], label: card['label'],)
          ),
          ...cardData.map(
            ( card ) => _CardType4(elevation: card['elevation'], label: card['label'],)
          ),

          const SizedBox(height:20)
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {

  final double elevation;
  final String label;

  const _CardType1({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {

  final double elevation;
  final String label;

  const _CardType2({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {

    final color = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        side: BorderSide(
          color: color.outline
        ),
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline'),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {

  final double elevation;
  final String label;

  const _CardType3({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surface,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - filled'),
            )
          ],
        ),
      ),
    );
  }
}


class _CardType4 extends StatelessWidget {

  final double elevation;
  final String label;

  const _CardType4({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${ elevation.toInt() }/600/350',
            height: 350,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
              ),
              child: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}