import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hangman/models/message.dart';
import 'package:hangman/views/game_view.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StartViewController extends GetxController {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController school = TextEditingController();

  List<Message> uzenetek = [];

  bool isLoading = false;

  void jatekInditasa() async {
    if (firstname.text == "" && lastname.text != "" && school.text != "") {
      //beléphet a játékba
      isLoading = true;
      update();
      int userID = await jatekosRegisztralasa();
      if (userID != -1) {
        await uzenetekLekerese();
        if (uzenetek.length == 2) {
          Get.to(
            GameView(userId: userID, messages: uzenetek),
            transition: Transition.cupertino,
          );
        } else {
          Get.dialog(CupertinoAlertDialog(
            title: Text("Hálózati Hiba!"),
            content: Text("Sajnos nem kaptam megfelelő adatot a backendtől!"),
            actions: [
              CupertinoDialogAction(
                child: Text("ok"),
                onPressed: () {
                  Get.back();
                },
              )
            ],
          ));
        }
      }
    } else if (firstname.text == "") {
      Get.dialog(CupertinoAlertDialog(
        title: Text("Tölts ki minden adatot"),
        content: Text("Nem adtad meg a keresztneved!"),
        actions: [
          CupertinoDialogAction(
            child: Text("ok"),
            onPressed: () {
              Get.back();
            },
          )
        ],
      ));
    } else if (lastname.text == "") {
      Get.dialog(CupertinoAlertDialog(
        title: Text("Tölts ki minden adatot"),
        content: Text("Nem adtad meg a vezetékneved!"),
        actions: [
          CupertinoDialogAction(
            child: Text("ok"),
            onPressed: () {
              Get.back();
            },
          )
        ],
      ));
    } else {
      Get.dialog(CupertinoAlertDialog(
        title: Text("Tölts ki minden adatot"),
        content: Text("Nem adtad meg az iskoládat!"),
        actions: [
          CupertinoDialogAction(
            child: Text("ok"),
            onPressed: () {
              Get.back();
            },
          )
        ],
      ));
    }
  }

  Future<int> jatekosRegisztralasa() async {
    var response = await http.post(
        Uri.parse("http://nodejs1.dszcbaross.edu.hu:21005/player"),
        body: {
          'firstname': firstname.text,
          'lastname': lastname.text,
          'school': school.text
        });
    print("response: " + response.body);
    return int.parse(response.body);
  }

  Future uzenetekLekerese() async {
    var response = await http.get(
      Uri.parse("http://nodejs1.dszcbaross.edu.hu:21005/game/random/2"),
    );
    List<dynamic> jsonResponse = json.decode(response.body);
    uzenetek = jsonResponse.map((data) => Message.fromJson(data)).toList();
    print(uzenetek.length);
    print(uzenetek[0].content);
  }
}
