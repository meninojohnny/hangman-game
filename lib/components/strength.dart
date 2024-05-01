import 'package:flutter/material.dart';

class Strength extends StatelessWidget {
  final int errors;
  const Strength({super.key, required this.errors});

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