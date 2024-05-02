import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String letter;
  final Function(String) setLetter;
  final bool press;
  const Button({super.key, required this.letter, required this.setLetter, required this.press});

  @override
  ButtonState createState() => ButtonState();
}

class ButtonState extends State<Button> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: widget.press == false
            ? () {
                widget.setLetter(widget.letter);
              }
            : null,
        child: Container(
          height: 40,
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.press ? const Color.fromARGB(255, 191, 188, 188) : Colors.white,
          ),
          child: Center(
            child: Text(
              widget.letter,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: widget.press
                      ? Colors.white
                      : const Color.fromARGB(201, 0, 0, 0)),
            ),
          ),
        ),
      ),
    );
  }
}
