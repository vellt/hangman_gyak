import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
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
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
            color: (controller.aMegadottBetuVoltEmar(letter))
                ? Colors.transparent
                : Colors.blue,
            borderRadius: BorderRadius.circular(10)),
        width: 60,
        height: 60,
        child: Center(
          child: (controller.aMegadottBetuVoltEmar(letter))
              ? Container()
              : Text(
                  letter,
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
        ),
      ),
      onPressed: (controller.aMegadottBetuVoltEmar(letter))
          ? null
          : () => controller.tippHozzaadasa(letter),
    );
  }
}
