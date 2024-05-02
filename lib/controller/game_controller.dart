import 'dart:math';

import 'package:hangman_game/data/word_bd.dart';

class GameController {
  final List<String> _chosenLetters = [];
  final List<String> _generatedWords = [];
  int _counterError = 0;
  String _word = "";
  String _tip = "";
  
  GameController() {
    generateData();
  }

  List<String> get chosenLetters => _chosenLetters;

  int get counterError => _counterError;

  String get word => _word;

  String get tip => _tip;

  void setLetter(String letter) {
    if (counterError < 6) {
        _chosenLetters.add(letter);
        verifyError(letter);
    }
  }

  void generateData(){
    int randomNumberCategory = Random().nextInt(WordBd.words.length);
    int randomNumberWord = Random().nextInt(WordBd.words[randomNumberCategory]['words'].length);
    _word = WordBd.words[randomNumberCategory]["words"][randomNumberWord];

    if (_generatedWords.contains(_word)) {
      generateData();
    }

    _generatedWords.add(_word);
    _tip = WordBd.words[randomNumberCategory]["tip"];

  }

  void verifyError(letter) {
    if (!word.split('').contains(letter)) {
      _counterError++;
    }
  }

  bool verifyWin() {
    bool controller = true;
    for (String i in word.split('')) {
      if (!_chosenLetters.contains(i) && i != " ") {
        controller = false;
      }
    }
    return controller;
  }

  bool verifyLoser() {
    if (counterError == 6) {
      return true;
    } else {
      return false;
    }
  }

  void reload() {
    _counterError = 0;
    _chosenLetters.clear();
    generateData();
  }
}
