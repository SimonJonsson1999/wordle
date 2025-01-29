import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wordle_clone/home/home.dart';
import 'package:wordle_clone/login/login_page.dart';
import 'package:wordle_clone/login/signup.dart';
import 'package:wordle_clone/themes/light_mode.dart';
import 'package:wordle_clone/wordle/wordle.dart';
import 'package:wordle_clone/wordle/wordle_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// TODO
// Connect to Firebase db
// Create setting and stats Page
// Create other modes to play
// Create animations for the app
// Load all acceptable words
// generate Correct word from all words
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.signOut();
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
        // home: AuthWrapper(),
        // builder: (context, child) {
        //   return const AuthWrapper();
        // },
        routes: {
          '/register': (context) => const SignUpPage(),
          '/login': (context) => const LoginPage(),
          '/': (context) => const HomePage(),
          '/play': (context) => const WordlePage(),
        },
        initialRoute: "/",
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
