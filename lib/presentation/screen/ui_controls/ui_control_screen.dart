import 'package:flutter/material.dart';

class UiControlScreen extends StatelessWidget {
  const UiControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, bike, train, airplane }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text('Switch List Tile'),
            subtitle: const Text('Switch List Tile Subtitle'),
            value: isDeveloper,
            onChanged: (value) => setState(() {
                  isDeveloper = !isDeveloper;
                })),
        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle: Text(
              'El vehiculo seleccionado es un: ${selectTransportation.toString().split('.').last.toUpperCase()}'),
          children: [
            RadioListTile(
              title: const Text('Car'),
              subtitle: const Text('Radio List Tile Subtitle for a car'),
              value: Transportation.car,
              groupValue: selectTransportation,
              onChanged: (value) => setState(() {
                selectTransportation = value as Transportation;
              }),
            ),
            RadioListTile(
              title: const Text('Bike'),
              subtitle: const Text('Radio List Tile Subtitle for a bike'),
              value: Transportation.bike,
              groupValue: selectTransportation,
              onChanged: (value) => setState(() {
                selectTransportation = value as Transportation;
              }),
            ),
            RadioListTile(
              title: const Text('Train'),
              subtitle: const Text('Radio List Tile Subtitle for a train'),
              value: Transportation.train,
              groupValue: selectTransportation,
              onChanged: (value) => setState(() {
                selectTransportation = value as Transportation;
              }),
            ),
            RadioListTile(
              title: const Text('Airplane'),
              subtitle: const Text('Radio List Tile Subtitle for a airplane'),
              value: Transportation.airplane,
              groupValue: selectTransportation,
              onChanged: (value) => setState(() {
                selectTransportation = value as Transportation;
              }),
            ),
          ],
        ),

        CheckboxListTile(
          title: const Text('Quiere incluir el desayuno?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('Quiere incluir el almuerzo?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('Quiere incluir la cena?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        )
      ],
    );
  }
}
