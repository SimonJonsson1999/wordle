import 'package:flutter/material.dart';
import 'package:wordle_clone/helper.dart';

class WordleState with ChangeNotifier {
  String correctWord;
  List<Guess> guesses = [];
  int currentGuess = 0;
  Map<String, KeyStatus> keyboardStatus = {};
  bool hasWon = false;

  WordleState({required correctWord})
      : correctWord = correctWord.toUpperCase() {
    _initializeState();
  }

  _initializeState() {
    guesses =
        List.generate(maxGuesses + 1, (_) => Guess(letters: [], keyStatus: []));
    keyboardStatus = createKeyboardColorMap();
  }

  void onKeyTap(String letter) {
    if (currentGuess >= 6 || hasWon) return;

    if (letter == 'Enter') {
      submitGuess();
    } else if (letter == 'Backspace') {
      removeLetter();
    } else {
      addLetter(letter);
    }
    notifyListeners();
  }

  void submitGuess() {
    if (guesses[currentGuess].letters.length == wordLength) {
      if (guesses[currentGuess].letters.join() == correctWord) {
        hasWon = true;
      }
      updateGuessColors();
      currentGuess++;
    }
  }

  void addLetter(String letter) {
    if (guesses[currentGuess].letters.length < wordLength) {
      guesses[currentGuess].letters.add(letter);
      guesses[currentGuess].keyStatus.add(KeyStatus.notPressed);
    }
  }

  void removeLetter() {
    if (guesses[currentGuess].letters.isNotEmpty) {
      guesses[currentGuess].letters.removeLast();
      guesses[currentGuess].keyStatus.removeLast();
    }
  }

  void updateGuessColors() {
    final Guess currentGuessData = guesses[currentGuess];
    for (int i = 0; i < wordLength; i++) {
      final String letter = currentGuessData.letters[i];
      final bool isCorrectPosition = letter == correctWord[i];
      final bool isInWord = correctWord.contains(letter.toUpperCase());
      if (isCorrectPosition) {
        _updateColor(i, letter, KeyStatus.correct);
      } else if (isInWord) {
        _updateColor(i, letter, KeyStatus.present, yellow: true);
      } else {
        _updateColor(i, letter, KeyStatus.incorrect, remove: true);
      }
    }
  }

  void _updateColor(int index, String letter, KeyStatus keyStatus,
      {bool yellow = false, bool remove = false}) {
    guesses[currentGuess].keyStatus[index] = keyStatus;
    if (remove) {
      keyboardStatus[letter] = KeyStatus.incorrect;
    } else if (yellow && keyboardStatus[letter] != KeyStatus.correct) {
      keyboardStatus[letter] = KeyStatus.present;
    } else {
      keyboardStatus[letter] = keyStatus;
    }
  }

  void resetGame() {
    currentGuess = 0;
    hasWon = false;
    guesses =
        List.generate(maxGuesses + 1, (_) => Guess(letters: [], keyStatus: []));
    keyboardStatus = createKeyboardColorMap();
    notifyListeners();
  }
}

final List<List<String>> keys = [
  ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', 'Å'],
  ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'Ö', 'Ä'],
  ['Enter', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'Backspace'],
];

Map<String, KeyStatus> createKeyboardColorMap() {
  Map<String, KeyStatus> keyStatus = {};

  for (var row in keys) {
    for (var key in row) {
      keyStatus[key] = KeyStatus.notPressed;
    }
  }
  return keyStatus;
}

class Guess {
  final List<String> letters;
  final List<KeyStatus> keyStatus;

  Guess({required this.letters, required this.keyStatus});
}

enum KeyStatus {
  notPressed,
  correct,
  present,
  incorrect,
}
