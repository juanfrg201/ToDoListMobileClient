import 'package:flutter/material.dart';

const Color customColor = Colors.blue;

const List<Color> colorTheme = [
  customColor,
  Colors.black,
  Color.fromARGB(255, 2, 55, 99),
  Colors.yellow,
  Colors.purple,
  Colors.red,
  Colors.green,
];

class AppTheme{
  final int selectColor;

  AppTheme({
    this.selectColor = 0
  }): assert (selectColor >= 0 && selectColor < colorTheme.length - 1, 'Colors must be in the arr 0 and ${colorTheme.length}' );

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorTheme[selectColor]
    );
  }

}