import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangman/controllers/home_view_controller.dart';
import 'package:hangman/views/game_view.dart';

class HomeView extends StatelessWidget {
  HomeViewController controller = Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(
        init: controller,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Hangman"),
              centerTitle: true,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset("images/logo.webp"),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: TextField(
                    controller: controller.firstname,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "add meg a keresztneved",
                      labelText: "Keresztnév",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: TextField(
                    controller: controller.lastname,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "add meg a vezetékneved",
                      labelText: "Vezetéknév",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: TextField(
                    controller: controller.school,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "add meg az iskkoládat",
                      labelText: "Iskola",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: CupertinoButton.filled(
                    child: Text("Start game"),
                    onPressed: () {
                      controller.jatekInditasa();
                    },
                  ),
                )
              ],
            ),
          );
        });
  }
}
