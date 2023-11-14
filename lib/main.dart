import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangman/views/end_view.dart';
import 'package:hangman/views/game_view.dart';
import 'package:hangman/views/start_view.dart';

void main() {
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartView())); //EndView("Egy elegáns toll a tiéd lett!", 5)));
}
