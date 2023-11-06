import 'package:confetti/confetti.dart';
import 'package:get/get.dart';

class EndViewController extends GetxController {
  ConfettiController confettiController = ConfettiController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    confettiController.play();
  }
}
