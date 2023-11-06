import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:hangman/controllers/game_view_controller.dart';

class LetterButton extends StatelessWidget {
  const LetterButton({
    required this.letter,
    required this.controller,
  });

  final GameViewController controller;
  final String letter;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      padding: EdgeInsets.zero,
      child: Text(letter),
      onPressed: (controller.aMegadottBetuVoltEmar(letter))
          ? null
          : () => controller.tippHozzaadasa(letter),
    );
  }
}
