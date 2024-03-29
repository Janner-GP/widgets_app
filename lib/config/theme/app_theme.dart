

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
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false}):assert ( selectedColor >= 0 , 'selectedColor must be greater that 0'), assert ( selectedColor < colorList.length , 'selectedColor must be less than ${colorList.length}');

  ThemeData getTheme () => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    )
  );

  AppTheme copyWith({
    bool? isDarkMode,
    int? selectedColor,
  }) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode,
  );

}