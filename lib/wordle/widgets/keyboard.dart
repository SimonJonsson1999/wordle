import 'package:flutter/material.dart';
import 'package:wordle_clone/helper.dart';

class WordleKeyboard extends StatelessWidget {
  final int currentGuess;
  final String correctWord;
  final List<List<String>> keyboardButtons;
  final List<Guess> guesses;
  final void Function(String) onKeyTap;
  const WordleKeyboard({
    super.key,
    required this.keyboardButtons,
    required this.guesses,
    required this.correctWord,
    required this.currentGuess,
    required this.onKeyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: keyboardButtons.map((row) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: row.map((key) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: KeyboardButton(
                      keyboardKey: key,
                      correctWord: correctWord,
                      guesses: guesses,
                      currentGuess: currentGuess,
                      onKeyTap: onKeyTap,
                    ),
                  ),
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class KeyboardButton extends StatelessWidget {
  final int currentGuess;
  final List<Guess> guesses;
  final String correctWord;
  final String keyboardKey;
  final Function(String) onKeyTap;

  const KeyboardButton({
    super.key,
    required this.keyboardKey,
    required this.correctWord,
    required this.guesses,
    required this.currentGuess,
    required this.onKeyTap,
  });

  @override
  Widget build(BuildContext context) {
    if (keyboardKey == 'Backspace') {
      return GestureDetector(
        onTap: () => onKeyTap(keyboardKey),
        child: Container(
          height: 50,
          color: Color(0xff3a4f69),
          child: Center(
            child: const Icon(
              Icons.keyboard_backspace_rounded,
              color: Colors.white,
              size: 10,
            ),
          ),
        ),
      );
    }

    ColorPair colorPair =
        _getColor(keyboardKey, correctWord, guesses, currentGuess);
    Color boxColor = colorPair.firstColor;
    Color textColor = colorPair.secondColor;

    return GestureDetector(
      onTap: () => onKeyTap(keyboardKey),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Center(
          child: Text(
            keyboardKey,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  ColorPair _getColor(String? letter, String correctWord, List<Guess> guesses,
      int currentGuessIndex) {
    Color boxColor = BoxColor.background.color;
    Color textColor = Colors.white;
    if (letter == null || letter.isEmpty) {
      return ColorPair(boxColor, textColor);
    }

    for (int i = 0; i < currentGuessIndex; i++) {
      List<String> currentGuess = guesses[i].letters;
      int index = currentGuess.indexOf(letter);
      if ((index != -1) && (i != currentGuessIndex)) {
        if (letter == correctWord[index]) {
          boxColor = BoxColor.green.color;
          textColor = Colors.black;
          return ColorPair(boxColor, textColor);
        } else if (correctWord.contains(letter)) {
          boxColor = BoxColor.yellow.color;
          textColor = Colors.black;
        }
      }
    }
    return ColorPair(boxColor, textColor);
  }
}
