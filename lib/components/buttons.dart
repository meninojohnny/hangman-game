import 'package:flutter/material.dart';
import 'package:hangman_game/components/button.dart';

class Butons {
  final int numButons;
  final List<String> alphabet;
  int counter;
  final Function(String) setLetter;
  final List<String> letrasEscolhidas;

  Butons({required this.numButons, required this.alphabet, required this.setLetter, required this.counter, required this.letrasEscolhidas});

  List<Widget> generateButons() {
    List<Widget> buttons = [];

    for (int i = 0; i <= numButons; i++) {
      String letter = alphabet[i + counter];
      buttons.add(Button(letter: letter, setLetter: setLetter, press: letrasEscolhidas.contains(letter),));
      debugPrint(counter.toString());
    }
    counter += 1;
    return buttons;
  }
}