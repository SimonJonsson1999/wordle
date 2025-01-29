import 'package:flutter/material.dart';

ElevatedButton button(
    BuildContext context, VoidCallback onKeyTap, String text) {
  return ElevatedButton(
    onPressed: onKeyTap,
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: Colors.black,
            width: 1,
          )),
    ),
    child: Text(
      text,
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.shadow),
    ),
  );
}
