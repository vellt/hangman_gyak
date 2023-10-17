// játék logika
import 'dart:math';
import 'package:get/get.dart';
import 'package:hangman/models/tipp.dart';

class GameViewController extends GetxController {
  List<String> szovegek = [
    "alma piros",
    "az ég kék",
    "gurul a szekér",
  ];

  String randomSzoveg = ""; //alma

  String csillagosSzoveg = ""; //****

  void randomSzovegGeneralasa() {
    int index = Random().nextInt(szovegek.length); //]0,szoveghossz];
    randomSzoveg = szovegek[index];
    csillagosSzoveg = "";
    for (int i = 0; i < randomSzoveg.length; i++) {
      csillagosSzoveg += "*";
    }
    update();
  }

  List<Tipp> tippek = [];

  bool nyertEaFelhasznalo() {
    return csillagosSzoveg == randomSzoveg;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    randomSzovegGeneralasa();
  }
}
