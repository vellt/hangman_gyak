import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangman/controllers/end_view_controller.dart';
import 'package:hangman/controllers/start_view_controller.dart';
import 'package:hangman/views/start_view.dart';

class EndView extends StatelessWidget {
  String title;
  String uzenet;
  String prefixuzenet;
  int uid;
  int mid;
  int index;
  EndView(this.title, this.prefixuzenet, this.uzenet, this.index, this.uid,
      this.mid);

  EndViewController controller = Get.put(EndViewController());

  @override
  Widget build(BuildContext context) {
    if (index < 6) {
      controller.win(uid, mid);
    }
    return GetBuilder<EndViewController>(
        init: controller,
        builder: (_) {
          return (controller.isLoading)
              ? Container(
                  color: Color.fromARGB(255, 57, 22, 119),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                )
              : Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Scaffold(
                      appBar: AppBar(
                        backgroundColor: (index < 6) ? Colors.blue : Colors.red,
                        automaticallyImplyLeading: false,
                        title: Text(title),
                        centerTitle: true,
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: IconButton(
                                onPressed: () {
                                  Get.delete<StartViewController>();
                                  Get.offAll(StartView());
                                },
                                icon: Icon(Icons.arrow_forward_ios_outlined)),
                          )
                        ],
                      ),
                      backgroundColor: Color.fromARGB(255, 57, 22, 119),
                      body: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                (index < 6)
                                    ? Image.asset("images/win.webp", width: 250)
                                    : Image.asset("images/$index.png",
                                        width: 250),
                                SizedBox(
                                  height: 80,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 60),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 25),
                                      child: Center(
                                        child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: prefixuzenet,
                                                style: TextStyle(
                                                    fontSize: 40,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text: uzenet,
                                                style: TextStyle(
                                                    fontSize: 40,
                                                    color: Colors.black))
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          (index < 6)
                              ? ConfettiWidget(
                                  confettiController:
                                      controller.confettiController,
                                  shouldLoop: true,
                                  blastDirectionality:
                                      BlastDirectionality.explosive,
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                );
        });
  }
}
