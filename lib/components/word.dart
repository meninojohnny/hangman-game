import 'package:flutter/material.dart';
import 'package:hangman_game/components/letter.dart';

class Word extends StatelessWidget {
  final String word;
  final List<String> chosenLetters;
  final List<Letter> wordWidgets = [];
  Word({super.key, required this.word, required this.chosenLetters});

  void gerarWidgets() {
    word.toUpperCase().split("").forEach((element) {
      wordWidgets.add(
        Letter(
          letter: (element == " ") ? "-" : element,
          chosenLetters: chosenLetters,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    gerarWidgets();
    return Wrap(
      alignment: WrapAlignment.center,
      children: wordWidgets,
    );
  }
}
