import 'package:flutter/material.dart';
import 'package:wordle_clone/helper.dart';
import 'package:wordle_clone/wordle/wordle_state.dart';
import 'package:provider/provider.dart';

class WordleKeyboard extends StatelessWidget {
  const WordleKeyboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<WordleState>(
              builder: (context, wordleState, _) {
                return Column(
                  children: wordleState.keys.map((row) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: row.map((key) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: KeyboardButton(keyboardKey: key),
                          ),
                        );
                      }).toList(),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class KeyboardButton extends StatelessWidget {
  final String keyboardKey;
  const KeyboardButton({super.key, required this.keyboardKey});

  @override
  Widget build(BuildContext context) {
    return Consumer<WordleState>(
      builder: (context, wordleState, _) {
        final ThemeData theme = Theme.of(context);
        final KeyStatus keyStatus =
            wordleState.keyboardStatus[keyboardKey] ?? KeyStatus.notPressed;
        final boxColor = getColorForKeyStatus(keyStatus, context);
        final textColor = _getTextColorForKeyStatus(keyStatus, theme);

        if (keyboardKey == 'Backspace') {
          return _buildBackspaceButton(theme, wordleState);
        }
        return _buildRegularButton(boxColor, textColor, wordleState);
      },
    );
  }

  Color _getTextColorForKeyStatus(KeyStatus keyStatus, ThemeData theme) {
    switch (keyStatus) {
      case KeyStatus.incorrect:
        return theme.colorScheme.tertiary;
      case KeyStatus.notPressed:
        return theme.colorScheme.shadow;
      default:
        return Colors.black;
    }
  }

  Widget _buildRegularButton(
      Color boxColor, Color textColor, WordleState wordleState) {
    return GestureDetector(
      onTap: () => wordleState.onKeyTap(keyboardKey),
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
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton(ThemeData theme, WordleState wordleState) {
    return GestureDetector(
      onTap: () => wordleState.onKeyTap(keyboardKey),
      child: Container(
        height: 50,
        color: theme.colorScheme.primary,
        child: Center(
          child: Icon(
            Icons.keyboard_backspace_rounded,
            color: theme.colorScheme.shadow,
            size: 24,
          ),
        ),
      ),
    );
  }
}
