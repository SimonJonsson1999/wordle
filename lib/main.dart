import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wordle_clone/home/home.dart';
import 'package:wordle_clone/themes/light_mode.dart';
import 'package:wordle_clone/wordle/wordle.dart';
import 'package:wordle_clone/wordle/wordle_state.dart';

// TODO
// Connect to Firebase db
// Create setting and stats Page
// Create other modes to play
// Create animations for the app
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const Wordle());
}

class Wordle extends StatelessWidget {
  const Wordle({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WordleState(correctWord: "World"),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Wordle",
        theme: lightMode,
        routes: {
          '/': (context) => const HomePage(),
          '/play': (context) => const WordlePage(),
        },
        initialRoute: '/',
      ),
    );
  }
}
