import 'package:flutter/material.dart';
import 'package:hangman_game/components/buttons.dart';

class Keyboard extends StatelessWidget {
  final Function(String) setLetter;
  final List<String> chosenLetters;
  const Keyboard(
      {super.key, required this.setLetter, required this.chosenLetters});

  @override
  Widget build(BuildContext context) {
    List<String> alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
    return Column(
      children: [
        Row(
          children: Butons(
                  numButons: 7,
                  alphabet: alphabet,
                  setLetter: setLetter,
                  counter: 0,
                  chosenLetters: chosenLetters)
              .generateButons(),
        ),
        Row(
          children: Butons(
                  numButons: 7,
                  alphabet: alphabet,
                  setLetter: setLetter,
                  counter: 8,
                  chosenLetters: chosenLetters)
              .generateButons(),
        ),
        Row(
          children: Butons(
                  numButons: 7,
                  alphabet: alphabet,
                  setLetter: setLetter,
                  counter: 16,
                  chosenLetters: chosenLetters)
              .generateButons(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: Butons(
                  numButons: 1,
                  alphabet: alphabet,
                  setLetter: setLetter,
                  counter: 24,
                  chosenLetters: chosenLetters)
              .generateButons(),
        ),
      ],
    );
  }
}
