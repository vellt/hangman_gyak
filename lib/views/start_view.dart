import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangman/controllers/start_view_controller.dart';

class StartView extends StatelessWidget {
  StartViewController controller = Get.put(StartViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartViewController>(
        init: controller,
        builder: (_) {
          return (controller.isLoading == true)
              ? Container(
                  color: Color.fromARGB(255, 57, 22, 119),
                  child: Center(
                      child: CircularProgressIndicator(color: Colors.white)),
                )
              : Scaffold(
                  backgroundColor: Color.fromARGB(255, 57, 22, 119),
                  body: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      constraints:
                          BoxConstraints(maxWidth: 550, maxHeight: 700),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                              width: 350,
                              height: 350,
                              child: Image.asset(
                                "images/logo.webp",
                                fit: BoxFit.contain,
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 40),
                            child: TextField(
                              controller: controller.lastname,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "add meg a beceneved",
                                labelText: "Becenév",
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 40),
                            child: TextField(
                              controller: controller.school,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "add meg az iskoládat",
                                labelText: "Iskola",
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 40),
                            child: CupertinoButton(
                              color: Color.fromARGB(255, 57, 22, 119),
                              child: Text(
                                "Játék indítása",
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                controller.jatekInditasa();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
        });
  }
}
