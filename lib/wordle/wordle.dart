import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle_clone/wordle/widgets/grid.dart';
import 'package:wordle_clone/wordle/widgets/header.dart';
import 'package:wordle_clone/wordle/widgets/keyboard.dart';
import 'package:wordle_clone/wordle/wordle_state.dart';

class WordlePage extends StatelessWidget {
  const WordlePage({super.key});

  @override
  Widget build(BuildContext context) {
    final wordleState = Provider.of<WordleState>(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const WordleHeader(),
              const Divider(),
              WordleGrid(),
              const Divider(),
              WordleKeyboard(),
            ],
          ),
          if (wordleState.hasWon) _buildWinOverlay(context, wordleState),
        ],
      ),
    );
  }

  Widget _buildWinOverlay(BuildContext context, WordleState wordleState) {
    return Container(
      color: Colors.black.withValues(alpha: 0.35),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "You Won!",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: wordleState.resetGame,
              child: const Text("Play Again"),
            ),
          ],
        ),
      ),
    );
  }
}
