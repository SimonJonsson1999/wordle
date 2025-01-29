import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String route;
  final String text;
  final VoidCallback? onPressed;
  const Button({
    super.key,
    required this.route,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () => Navigator.of(context).pushNamed(route),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        minimumSize: const Size(150, 100),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.tertiary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
