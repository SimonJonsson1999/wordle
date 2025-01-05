import 'package:flutter/material.dart';
import 'package:wordle_clone/helper.dart';
import 'package:wordle_clone/wordle/wordle_state.dart';
import 'package:provider/provider.dart';

class WordleGrid extends StatelessWidget {
  const WordleGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(maxGuesses, (index) {
          return WordleRow(row: index);
        }),
      ),
    );
  }
}

class WordleRow extends StatelessWidget {
  final int row;

  const WordleRow({
    super.key,
    required this.row,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<WordleState>(
      builder: (context, wordleState, child) {
        List<String> letters = wordleState.guesses[row].letters;
        List<KeyStatus> keystatus = wordleState.guesses[row].keyStatus;

        return Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: List.generate(wordLength, (index) {
              String? letter = index < letters.length ? letters[index] : null;
              Color boxColor = (index < keystatus.length)
                  ? getColorForKeyStatus(keystatus[index], context)
                  : Theme.of(context).colorScheme.primary;

              return WordleBox(letter: letter, boxColor: boxColor);
            }),
          ),
        );
      },
    );
  }
}

class WordleBox extends StatelessWidget {
  final Color boxColor;
  final String? letter;

  const WordleBox({
    super.key,
    required this.letter,
    required this.boxColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: boxColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 1,
          ),
        ],
        border: Border.all(
          color: Theme.of(context).colorScheme.shadow,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          letter ?? "",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.shadow,
          ),
        ),
      ),
    );
  }
}
