import 'package:flutter/material.dart';
import 'package:lab2/constants/assets.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
  return Center(
    child: Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Image.asset(Assets.logo, height: 68),
        ),
        Stack(
          children: [
            Text(
              'RECEPT',
              style: TextStyle(
                fontSize: 48,
                fontFamily: 'Monoton',
                color: const Color.fromARGB(255, 3, 28, 58),
              ),
            ),
            Transform.rotate(
              angle: -20 * 3.1415 / 180, // roterar "Sök" lite
              child: Padding(
                padding: const EdgeInsets.only(left: 90, top: 20),
                child: Text(
                  'Sök',
                  style: TextStyle(
                    fontSize: 64,
                    fontFamily: 'Pacifico',
                    color: const Color(0xFFFFAC33),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
  }
}
