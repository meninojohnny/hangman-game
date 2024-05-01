import 'package:flutter/material.dart';
import 'package:hangman_game/components/strength.dart';
import 'package:hangman_game/components/keyboard.dart';
import 'package:hangman_game/components/word.dart';
import 'package:hangman_game/controller/game_controller.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GameController gameController = GameController();

  Future<bool?> showMessage(String text) {
    return Alert(
        context: context,
        title: text,
        content: const Text(
          textAlign: TextAlign.center,
          "Reiniciar Jogo?",
          style: TextStyle(fontSize: 20),
        ),
        buttons: [
          DialogButton(
              child: const Text(
                "Não",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          DialogButton(
              child: const Text(
                "Sim",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  gameController.reload();
                  Navigator.pop(context);
                });
              }),
        ]).show();
  }

  void setLetter(String letter) {
    setState(() {
      gameController.setLetter(letter);
    });
    if (gameController.verifyWin()) {
      showMessage("Você Ganhou!");
    } else if (gameController.verifyLoser()) {
      showMessage("Você Perdeu!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(76, 149, 108, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(44, 110, 73, 1),
        title: const Text(
          "Jogo da Forca",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                gameController.reload();
              });
            },
            icon: const Icon(
              Icons.replay_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const Text(
              "Dupla: João Vitor Silva e Bruno Silva",
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      if (gameController.counterError > 3)
                        Text(
                          "Dica: ${gameController.tip}",
                          style: const TextStyle(
                              fontSize: 22, color: Colors.white),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Strength(
                    errors: gameController.counterError,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Word(
                    word: gameController.word,
                    chosenLetters: gameController.chosenLetters,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Keyboard(
                    setLetter: setLetter,
                    letrasEscolhidas: gameController.chosenLetters,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
