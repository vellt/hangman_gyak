import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangman/controllers/game_view_controller.dart';
import 'package:hangman/views/widgets/letter_button.dart';
import 'package:hangman/views/widgets/letter_holder.dart';

class GameView extends StatelessWidget {
  GameViewController controller = Get.put(GameViewController());

  @override
  Widget build(BuildContext context) {
    controller.init();
    return GetBuilder<GameViewController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Hangman"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/${controller.hibakSzama()}.png"),
              Text(
                controller.csillagosSzoveg,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text(
                controller.randomSzoveg,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Column(
                children: [
                  LetterHolder(
                    letters: ["A", "Á", "B", "C", "D", "E"],
                    controller: controller,
                  ),
                  LetterHolder(
                    letters: ["É", "F", "G", "H", "I", "Í"],
                    controller: controller,
                  ),
                  LetterHolder(
                    letters: ["J", "K", "L", "M", "N", "O"],
                    controller: controller,
                  ),
                  LetterHolder(
                    letters: ["Ó", "Ö", "Ő", "P", "Q", "R"],
                    controller: controller,
                  ),
                  LetterHolder(
                    letters: ["S", "T", "U", "Ú", "Ü", "Ű"],
                    controller: controller,
                  ),
                  LetterHolder(
                    letters: ["V", "W", "X", "Y", "Z", " "],
                    controller: controller,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
