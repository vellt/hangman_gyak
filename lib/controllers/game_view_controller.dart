// játék logika
import 'dart:math';
import 'package:get/get.dart';
import 'package:hangman/models/tipp.dart';
import 'package:hangman/views/end_view.dart';

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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    randomSzovegGeneralasa();
  }
}
