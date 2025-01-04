import 'package:flutter/material.dart';
import 'package:wordle_clone/helper.dart';

class HomePageTitle extends StatelessWidget {
  final String title;
  const HomePageTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Theme.of(context).colorScheme.inversePrimary,
        fontSize: 40,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
