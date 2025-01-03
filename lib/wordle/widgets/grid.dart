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
          children: List.generate(6, (index) {
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
        children: List.generate(5, (index) {
          String? letter = index < letters.length ? letters[index] : null;
          Color boxColor =
              (index < colors.length) ? colors[index] : BoxColor.none.color;
          return WordleBox(
              letter: letter, boxColor: boxColor //guesses[row].colors[index],
              );
        }),
      ),
    );
  }

//   Color _getColor(
//     String? letter,
//     String correctWord,
//     List<Guess> guesses,
//     int prevGuessIndex,
//     int row,
//   ) {
//     Color color = BoxColor.none.color;
//     if (letter == null || letter.isEmpty || prevGuessIndex != row) {
//       return color;
//     }

//     List<String> currentGuess = guesses[prevGuessIndex];
//     int index = currentGuess.indexOf(letter);

//     if (index != -1) {
//       if (letter == correctWord[index]) {
//         color = BoxColor.green.color;
//       } else if (correctWord.contains(letter)) {
//         color = BoxColor.yellow.color;
//       }
//     }

//     return color;
//   }
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
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          letter ?? "",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
