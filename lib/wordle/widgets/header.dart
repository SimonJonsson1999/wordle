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
          color: Theme.of(context).colorScheme.primary,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.query_stats,
          color: Theme.of(context).colorScheme.primary,
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
        color: Theme.of(context).colorScheme.primaryFixed,
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
      icon: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Icon(
          Icons.arrow_back_ios_new,
          color: Theme.of(context).colorScheme.primary,
          size: 16,
        ),
      ),
    );
  }
}
