import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangman/controllers/end_view_controller.dart';
import 'package:hangman/views/home_view.dart';

class EndView extends StatelessWidget {
  String uzenet;
  int index;
  EndView(this.uzenet, this.index);

  EndViewController controller = Get.put(EndViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EndViewController>(
        init: controller,
        builder: (_) {
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (index < 6)
                          ? Image.asset("images/win.jpg", width: 200)
                          : Image.asset("images/$index.png"),
                      Center(
                        child: Text(
                          uzenet,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CupertinoButton.filled(
                        child: Text("Vissza a kezdőlapra"),
                        onPressed: () {
                          Get.offAll(HomeView());
                        },
                      )
                    ],
                  ),
                ),
              ),
              (index < 6)
                  ? ConfettiWidget(
                      confettiController: controller.confettiController,
                      shouldLoop: true,
                      blastDirectionality: BlastDirectionality.explosive,
                    )
                  : Container(),
            ],
          );
        });
  }
}
