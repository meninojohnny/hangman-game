import 'package:flutter/material.dart';

class Letter extends StatelessWidget {
  final String letter;
  final List<String> chosenLetters;
  const Letter({super.key, required this.letter, required this.chosenLetters});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 35,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          if(chosenLetters.contains(letter) || letter == "-")
          Text(
            letter,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          Container(
            height: 5,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: (letter == "-") ? null : Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
