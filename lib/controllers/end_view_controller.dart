import 'package:confetti/confetti.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EndViewController extends GetxController {
  ConfettiController confettiController = ConfettiController();

  bool isLoading = false;

  void win(int uid, int mid) async {
    isLoading = true;
    update();
    var response = await http.get(
      Uri.parse("http://nodejs1.dszcbaross.edu.hu:21005/winner/$uid/$mid"),
    );
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    confettiController.play();
  }
}
