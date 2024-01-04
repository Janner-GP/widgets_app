

import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.orange,
  Colors.red,
  Colors.purple,
  Colors.black,
  Colors.green
];

class AppTheme {

  final int selectedColor;

  AppTheme({this.selectedColor = 0}):assert ( selectedColor >= 0 , 'selectedColor must be greater that 0'), assert ( selectedColor < colorList.length , 'selectedColor must be less than ${colorList.length}');

  ThemeData getTheme () => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    )
  );

}