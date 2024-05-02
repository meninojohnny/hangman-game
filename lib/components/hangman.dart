import 'package:flutter/material.dart';

class Hangman extends StatelessWidget {
  final int errors;
  const Hangman({super.key, required this.errors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 280,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/image$errors.png"))
      ),
    );
  }
}