import 'package:flutter/material.dart';
import 'package:hangman_game/components/buttons.dart';

class Keyboard extends StatelessWidget {
  final Function(String) setLetter;
  final List<String> letrasEscolhidas;
  const Keyboard(
      {super.key, required this.setLetter, required this.letrasEscolhidas});

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
                  letrasEscolhidas: letrasEscolhidas)
              .generateButons(),
        ),
        Row(
          children: Butons(
                  numButons: 7,
                  alphabet: alphabet,
                  setLetter: setLetter,
                  counter: 8,
                  letrasEscolhidas: letrasEscolhidas)
              .generateButons(),
        ),
        Row(
          children: Butons(
                  numButons: 7,
                  alphabet: alphabet,
                  setLetter: setLetter,
                  counter: 16,
                  letrasEscolhidas: letrasEscolhidas)
              .generateButons(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: Butons(
                  numButons: 1,
                  alphabet: alphabet,
                  setLetter: setLetter,
                  counter: 24,
                  letrasEscolhidas: letrasEscolhidas)
              .generateButons(),
        ),
      ],
    );
  }
}
