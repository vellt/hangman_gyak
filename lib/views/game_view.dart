import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangman/controllers/game_view_controller.dart';
import 'package:hangman/models/message.dart';
import 'package:hangman/views/widgets/letter_holder.dart';

class GameView extends StatelessWidget {
  int userId;
  List<Message> messages;
  GameView({required this.userId, required this.messages});
  @override
  Widget build(BuildContext context) {
    GameViewController controller =
        Get.put(GameViewController(userId, context, messages));
    controller.init();
    return GetBuilder<GameViewController>(
      init: controller,
      builder: (_) {
        return (!controller.theInitIsDone)
            ? Container(
                color: Color.fromARGB(255, 57, 22, 119),
                child: Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                )))
            : Scaffold(
                backgroundColor: Color.fromARGB(255, 57, 22, 119),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child:
                          Image.asset("images/${controller.hibakSzama()}.png"),
                      width: 350,
                      height: 350,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        controller.csillagosSzoveg,
                        style: TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            letterSpacing: 10),
                      ),
                    ),
                    Column(
                      children: [
                        LetterHolder(
                          letters: ["A", "Á", "B", "C", "D", "E", "É"],
                          controller: controller,
                        ),
                        LetterHolder(
                          letters: ["F", "G", "H", "I", "Í", "J", "K"],
                          controller: controller,
                        ),
                        LetterHolder(
                          letters: ["L", "M", "N", "O", "Ó", "Ö", "Ő"],
                          controller: controller,
                        ),
                        LetterHolder(
                          letters: ["P", "Q", "R", "S", "T", "U", "Ú"],
                          controller: controller,
                        ),
                        LetterHolder(
                          letters: ["Ü", "Ű", "V", "W", "X", "Y", "Z"],
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
