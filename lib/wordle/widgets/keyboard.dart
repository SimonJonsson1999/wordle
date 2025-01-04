import 'package:flutter/material.dart';
import 'package:wordle_clone/helper.dart';

class WordleKeyboard extends StatelessWidget {
  final Map<String, Color> keyboardStatus;
  final List<List<String>> keyboardButtons;
  final void Function(String) onKeyTap;
  const WordleKeyboard({
    super.key,
    required this.keyboardButtons,
    required this.onKeyTap,
    required this.keyboardStatus,
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
                      keyboardStatus: keyboardStatus,
                      keyboardKey: key,
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
  final Map<String, Color> keyboardStatus;
  final String keyboardKey;
  final Function(String) onKeyTap;

  const KeyboardButton({
    super.key,
    required this.keyboardKey,
    required this.onKeyTap,
    required this.keyboardStatus,
  });

  @override
  Widget build(BuildContext context) {
    if (keyboardKey == 'Backspace') {
      return GestureDetector(
        onTap: () => onKeyTap(keyboardKey),
        child: Container(
          height: 50,
          color: Theme.of(context).colorScheme.primary,
          child: Center(
            child: Icon(
              Icons.keyboard_backspace_rounded,
              color: Theme.of(context).colorScheme.shadow,
              size: 10,
            ),
          ),
        ),
      );
    }

    Color boxColor =
        keyboardStatus[keyboardKey] ?? Theme.of(context).colorScheme.primary;
    Color textColor = Colors.black;
    if (boxColor == Theme.of(context).colorScheme.primaryFixed) {
      textColor = Theme.of(context).colorScheme.tertiary;
    } else if (boxColor == Theme.of(context).colorScheme.primary) {
      textColor = Theme.of(context).colorScheme.shadow;
    }

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
}
