import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  final String headline;
  const Headline({super.key, required this.headline});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50.0),
      child: Center(
        child: Text(
          headline,
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
        ),
      ),
    );
  }
}
