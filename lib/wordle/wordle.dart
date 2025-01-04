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
      List.generate(maxGuesses, (_) => Guess(letters: [], colors: []));
  int currentGuess = 0;
  Map<String, Color> keyboardStatus = createKeyboardColorMap(keys);

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
            keyboardStatus: keyboardStatus,
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
    for (int i = 0; i < wordLength; i++) {
      String letter = guesses[currentGuess].letters[i];
      if (letter == correctWord[i]) {
        guesses[currentGuess].colors[i] = BoxColor.green.color;
        keyboardStatus[letter] = BoxColor.green.color;
      } else if (correctWord.contains(letter)) {
        guesses[currentGuess].colors[i] = BoxColor.yellow.color;
        if (keyboardStatus[letter] != BoxColor.green.color) {
          keyboardStatus[letter] = BoxColor.yellow.color;
        }
      } else {
        guesses[currentGuess].colors[i] = BoxColor.none.color;
        if (keyboardStatus[letter] == BoxColor.background.color) {
          keyboardStatus[letter] = Colors.transparent;
        }
      }
    }
  }

  void updateGuess(String letter) {
    setState(() {
      if (currentGuess < maxGuesses) {
        if ((guesses[currentGuess].letters.length == wordLength) &&
            (letter == 'Enter')) {
          updateGuessColors();
          currentGuess += 1;
        }
        if ((guesses[currentGuess].letters.length < wordLength) &&
            (letter != 'Backspace') &&
            (letter != 'Enter')) {
          guesses[currentGuess].letters.add(letter);
          guesses[currentGuess].colors.add(BoxColor.none.color);
        } else if ((guesses[currentGuess].letters.isNotEmpty) &&
            (letter == 'Backspace')) {
          guesses[currentGuess].letters.removeLast();
          guesses[currentGuess].colors.removeLast();
        }
      }
    });
  }
}
