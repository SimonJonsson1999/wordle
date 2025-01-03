import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wordle_clone/wordle/wordle.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const Wordle());
}

class Wordle extends StatelessWidget {
  const Wordle({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Wordle",
      theme: ThemeData(),
      routes: {
        '/': (context) => const WordlePage(),
        '/play': (context) => const WordlePage(),
      },
      initialRoute: '/',
    );
  }
}
