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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          WordleHeader(),
          Divider(),
          WordleGrid(),
          Divider(),
          WordleKeyboard(
            keyboardButtons: keys,
          ),
        ],
      ),
    );
  }
}
