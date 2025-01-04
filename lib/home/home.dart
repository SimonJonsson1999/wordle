import 'package:flutter/material.dart';
import 'package:wordle_clone/home/widgets/button.dart';
import 'package:wordle_clone/home/widgets/home_page_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomePageTitle(title: 'Wordle:)'),
            const SizedBox(height: 20),
            Button(text: "Play", route: "/play"),
            SizedBox(height: 20),
            Button(text: "Settings", route: "/"),
            SizedBox(height: 20),
            Button(text: "Stats", route: "/"),
          ],
        ),
      ),
    );
  }
}
