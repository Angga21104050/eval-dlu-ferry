import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0064D2), Color(0xFF0064D2), Colors.cyan],
        ),
        image: DecorationImage(
          image: AssetImage("assets/img/map-global.png"),
          alignment: Alignment.center,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
