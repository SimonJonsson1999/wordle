import 'package:flutter/material.dart';

class WordleHeader extends StatelessWidget {
  const WordleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BackButton(),
          TextWidget(),
          OptionsWidget(),
        ],
      ),
    );
  }
}

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.settings,
          color: Color(0xff5f9be8),
        ),
        Icon(
          Icons.query_stats,
          color: Color(0xff5f9be8),
        ),
      ],
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "WORDLE",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w700,
        color: Color(0xff5f9be8),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: Color(0xff5f9be8),
        size: 16,
      ),
    );
  }
}
