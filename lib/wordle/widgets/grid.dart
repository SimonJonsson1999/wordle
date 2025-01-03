import 'package:flutter/material.dart';

class WordleGrid extends StatefulWidget {
  const WordleGrid({super.key});

  @override
  State<WordleGrid> createState() => _WordleGridState();
}

class _WordleGridState extends State<WordleGrid> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 25,
          ),
          WordleRow(),
          WordleRow(),
          WordleRow(),
          WordleRow(),
          WordleRow(),
          WordleRow(),
        ],
      ),
    );
  }
}

class WordleRow extends StatefulWidget {
  const WordleRow({super.key});

  @override
  State<WordleRow> createState() => _WordleRowState();
}

class _WordleRowState extends State<WordleRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          WordleBox(),
          WordleBox(),
          WordleBox(),
          WordleBox(),
          WordleBox(),
        ],
      ),
    );
  }
}

class WordleBox extends StatefulWidget {
  const WordleBox({super.key});

  @override
  State<WordleBox> createState() => _WordleBoxState();
}

class _WordleBoxState extends State<WordleBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          color: Color(0xffd5e6e7),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 1,
            )
          ],
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
