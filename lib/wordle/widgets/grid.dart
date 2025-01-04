import 'package:flutter/material.dart';
import 'package:wordle_clone/helper.dart';

class WordleGrid extends StatelessWidget {
  final List<Guess> guesses;
  const WordleGrid({
    super.key,
    required this.guesses,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(maxGuesses, (index) {
            return WordleRow(
              guesses: guesses,
              row: index,
            );
          })),
    );
  }
}

class WordleRow extends StatelessWidget {
  final List<Guess> guesses;
  final int row;
  const WordleRow({
    super.key,
    required this.guesses,
    required this.row,
  });

  @override
  Widget build(BuildContext context) {
    List<String> letters = guesses[row].letters;
    List<Color> colors = guesses[row].colors;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: List.generate(wordLength, (index) {
          String? letter = index < letters.length ? letters[index] : null;
          Color boxColor = (index < colors.length)
              ? colors[index]
              : Theme.of(context).colorScheme.primary;
          return WordleBox(letter: letter, boxColor: boxColor);
        }),
      ),
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
            )
          ],
          border: Border.all(
            color: Theme.of(context).colorScheme.shadow,
          ),
          borderRadius: BorderRadius.circular(10)),
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
