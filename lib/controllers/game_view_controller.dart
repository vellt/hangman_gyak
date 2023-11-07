// játék logika
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hangman/models/tipp.dart';
import 'package:hangman/views/end_view.dart';

class GameViewController extends GetxController {
  GameViewController(this.context);
  BuildContext context;

  List<String> szovegek = [
    "a",
  ];

  String randomSzoveg = ""; //alma

  String csillagosSzoveg = ""; //****

  void init() {
    int index = Random().nextInt(szovegek.length); //]0,szoveghossz];
    randomSzoveg = szovegek[index];
    csillagosSzoveg = "";
    for (int i = 0; i < randomSzoveg.length; i++) {
      csillagosSzoveg += "*";
    }
    tippek = [];
    update();
  }

  List<Tipp> tippek = [];

  bool nyertEaFelhasznalo() {
    return csillagosSzoveg == randomSzoveg;
  }

  // game over
  bool vesztettEaFelhasznalo() {
    int szamlalo = 0;
    for (int i = 0; i < tippek.length; i++) {
      if (tippek[i].talaltE == false) {
        szamlalo++;
      }
    }
    if (szamlalo == 6)
      return true;
    else
      return false;
  }

  int hibakSzama() {
    int szamlalo = 0;
    for (int i = 0; i < tippek.length; i++) {
      if (tippek[i].talaltE == false) {
        szamlalo++;
      }
    }
    return szamlalo;
  }

  bool aMegadottBetuVoltEmar(String betu) {
    bool tartalmazza = false;
    for (int i = 0; i < tippek.length; i++) {
      if (tippek[i].karakter == betu) {
        tartalmazza = true;
        break;
      }
    }
    return tartalmazza;
  }

  void tippHozzaadasa(String betu) {
    if (randomSzoveg.toLowerCase().contains(betu.toLowerCase())) {
      // [*,*,*] ***
      List<String> csillagosSzovegTemp = csillagosSzoveg.split('');
      for (int i = 0; i < randomSzoveg.length; i++) {
        if (randomSzoveg[i].toLowerCase() == betu.toLowerCase()) {
          csillagosSzovegTemp[i] = randomSzoveg[i];
        }
      }
      csillagosSzoveg = csillagosSzovegTemp.join();

      // jó tipp
      tippek.add(Tipp(
        karakter: betu,
        talaltE: true,
      ));
      update();
      if (nyertEaFelhasznalo()) {
        Get.to(EndView("Gratulálok! Nyertél!", hibakSzama()));
      }
    } else {
      // rossz tipp
      tippek.add(Tipp(
        karakter: betu,
        talaltE: false,
      ));
      update();
      if (vesztettEaFelhasznalo()) {
        Get.to(EndView("Sajnos vesztettél! Amire gondoltam: ${randomSzoveg} ",
            hibakSzama()));
      }
    }
  }

  Future kepekLetarolasaCacheMemoriaba() async {
    await precacheImage(AssetImage('images/0.png'), context);
    await precacheImage(AssetImage('images/1.png'), context);
    await precacheImage(AssetImage('images/2.png'), context);
    await precacheImage(AssetImage('images/3.png'), context);
    await precacheImage(AssetImage('images/4.png'), context);
    await precacheImage(AssetImage('images/5.png'), context);
    await precacheImage(AssetImage('images/6.png'), context);
    await precacheImage(AssetImage('images/win.webp'), context);
  }

  bool theInitIsDone = false;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await kepekLetarolasaCacheMemoriaba();
    init();
    theInitIsDone = true;
  }
}
