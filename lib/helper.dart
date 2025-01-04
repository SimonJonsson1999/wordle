import 'package:flutter/material.dart';

final int maxGuesses = 6;
final int wordLength = 5;

final List<List<String>> keys = [
  ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', 'Å'],
  ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'Ö', 'Ä'],
  ['Enter', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'Backspace'],
];

Map<String, Color> createKeyboardColorMap(List<List<String>> keys) {
  Map<String, Color> colorMap = {};

  for (var row in keys) {
    for (var key in row) {
      colorMap[key] = BoxColor.background.color;
    }
  }
  return colorMap;
}

enum BoxColor {
  none,
  green,
  red,
  yellow,
  background,
}

extension BoxColorEnum on BoxColor {
  Color get color {
    switch (this) {
      case BoxColor.none:
        return Colors.grey;
      case BoxColor.green:
        return Color(0xff138204);
      case BoxColor.red:
        return Color(0xff870000);
      case BoxColor.yellow:
        return Color(0xffc6ca3c);
      case BoxColor.background:
        return Color(0xff3a4f69);
    }
  }
}

class ColorPair {
  final Color firstColor;
  final Color secondColor;
  ColorPair(this.firstColor, this.secondColor);
}

class Guess {
  final List<String> letters;
  final List<Color> colors;

  Guess({required this.letters, required this.colors});
}
