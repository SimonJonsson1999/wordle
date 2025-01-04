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
      List.generate(maxGuesses + 1, (_) => Guess(letters: [], colors: []));
  int currentGuess = 0;
  late Map<String, Color> keyboardStatus = {};
  bool hasWon = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        keyboardStatus = createKeyboardColorMap(context, keys);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
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
              onKeyTap: handleKeyTap,
            ),
          ],
        ),
        if (hasWon) _buildWinOverlay(),
      ]),
    );
  }

  Widget _buildWinOverlay() {
    return Container(
      color: Colors.black.withValues(alpha: 0.35),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "You Won!",
              style: TextStyle(
                fontSize: 40,
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetGame,
              child: const Text("Play Again"),
            ),
          ],
        ),
      ),
    );
  }

  void handleKeyTap(String letter) {
    setState(() {
      if (currentGuess < maxGuesses) {
        if (letter == 'Enter') {
          _submitGuess();
        } else if (letter == 'Backspace') {
          _removeLetter();
        } else {
          _addLetter(letter);
        }
      }
    });
  }

  void _submitGuess() {
    if (guesses[currentGuess].letters.length == wordLength) {
      if (guesses[currentGuess].letters.join() == correctWord) {
        hasWon = true;
      }
      updateGuessColors();
      currentGuess++;
    }
  }

  void _removeLetter() {
    if (guesses[currentGuess].letters.isNotEmpty) {
      guesses[currentGuess].letters.removeLast();
      guesses[currentGuess].colors.removeLast();
    }
  }

  void _addLetter(String letter) {
    if (guesses[currentGuess].letters.length < wordLength) {
      guesses[currentGuess].letters.add(letter);
      guesses[currentGuess].colors.add(Theme.of(context).colorScheme.primary);
    }
  }

  void updateGuessColors() {
    final Guess currentGuessData = guesses[currentGuess];
    for (int i = 0; i < wordLength; i++) {
      final String letter = currentGuessData.letters[i];
      final bool isCorrectPosition = letter == correctWord[i];
      final bool isInWord = correctWord.contains(letter);
      if (isCorrectPosition) {
        _updateColor(i, letter, BoxColor.green.color);
      } else if (isInWord) {
        _updateColor(i, letter, BoxColor.yellow.color, yellow: true);
      } else {
        _updateColor(i, letter, Theme.of(context).colorScheme.primaryFixed,
            remove: true);
      }
    }
  }

  void _updateColor(int index, String letter, Color color,
      {bool yellow = false, bool remove = false}) {
    setState(() {
      guesses[currentGuess].colors[index] = color;
      if (remove) {
        keyboardStatus[letter] = Theme.of(context).colorScheme.primaryFixed;
      } else if (yellow && keyboardStatus[letter] != BoxColor.green.color) {
        keyboardStatus[letter] = color;
      } else {
        keyboardStatus[letter] = color;
      }
    });
  }

  void _resetGame() {
    setState(() {
      currentGuess = 0;
      hasWon = false;
      guesses.forEach((guess) {
        guess.letters.clear();
        guess.colors.clear();
      });
      keyboardStatus = createKeyboardColorMap(context, keys);
    });
  }
}
