import 'package:flutter/material.dart';
import 'package:wordle_clone/helper.dart';
import 'package:wordle_clone/wordle/widgets/grid.dart';
import 'package:wordle_clone/wordle/widgets/header.dart';
import 'package:wordle_clone/wordle/widgets/keyboard.dart';

class WordlePage extends StatefulWidget {
  const WordlePage({super.key});

  @override
  State<WordlePage> createState() => _WordlePageState();
}

class _WordlePageState extends State<WordlePage> {
  final String correctWord = "WORLD";
  final List<Guess> guesses =
      List.generate(6, (_) => Guess(letters: [], colors: []));
  int currentGuess = 0;
  bool isGuessSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          WordleHeader(),
          Divider(),
          WordleGrid(
            guesses: guesses,
          ),
          Divider(),
          WordleKeyboard(
            keyboardButtons: keys,
            guesses: guesses,
            correctWord: correctWord,
            currentGuess: currentGuess,
            onKeyTap: updateGuess,
          ),
        ],
      ),
    );
  }

  void updateGuessColors() {
    for (int i = 0; i < 5; i++) {
      String letter = guesses[currentGuess].letters[i];
      if (letter == correctWord[i]) {
        guesses[currentGuess].colors[i] = BoxColor.green.color;
      } else if (correctWord.contains(letter)) {
        guesses[currentGuess].colors[i] = BoxColor.yellow.color;
      } else {
        guesses[currentGuess].colors[i] = BoxColor.none.color;
      }
    }
  }

  void updateGuess(String letter) {
    setState(() {
      if ((guesses[currentGuess].letters.length == 5) && (letter == 'Enter')) {
        updateGuessColors();
        currentGuess += 1;
        isGuessSubmitted = true;
      }
      if ((guesses[currentGuess].letters.length < 5) &&
          (letter != 'Backspace') &&
          (letter != 'Enter')) {
        guesses[currentGuess].letters.add(letter);
        guesses[currentGuess].colors.add(BoxColor.none.color);
        isGuessSubmitted = false;
      } else if ((guesses[currentGuess].letters.isNotEmpty) &&
          (letter == 'Backspace')) {
        guesses[currentGuess].letters.removeLast();
        guesses[currentGuess].colors.removeLast();
        isGuessSubmitted = false;
      }
    });
  }
}
