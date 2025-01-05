import 'package:flutter/material.dart';
import 'package:wordle_clone/wordle/wordle_state.dart';

final int maxGuesses = 6;
final int wordLength = 5;

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

Color getColorForKeyStatus(KeyStatus status, BuildContext context) {
  switch (status) {
    case KeyStatus.correct:
      return Colors.green;
    case KeyStatus.present:
      return Colors.yellow;
    case KeyStatus.incorrect:
      return Theme.of(context).colorScheme.primaryFixed;
    case KeyStatus.notPressed:
      return Theme.of(context).colorScheme.primary;
  }
}
