import 'package:flutter/material.dart';

class WordleKeyboard extends StatelessWidget {
  final List<List<String>> keyboardButtons;
  const WordleKeyboard({super.key, required this.keyboardButtons});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Align(
        alignment: Alignment.topCenter,
        child: Expanded(
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
                      ),
                    ),
                  );
                }).toList(),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class KeyboardButton extends StatelessWidget {
  final String keyboardKey;

  const KeyboardButton({
    super.key,
    required this.keyboardKey,
  });

  @override
  Widget build(BuildContext context) {
    if (keyboardKey == 'Backspace') {
      return Container(
        height: 50,
        color: Color(0xff3a4f69),
        child: Center(
          child: const Icon(
            Icons.keyboard_backspace_rounded,
            color: Colors.white,
            size: 10,
          ),
        ),
      );
    }
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xff3a4f69),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Center(
        child: Text(
          keyboardKey,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
