import 'dart:async';
import 'package:get/get.dart';

class OrderController extends GetController {
  bool stopped = false;
  bool gif = false;
  int number;
  List<Map<String, int>> jjothers = [
    {"Debs": 0},
    {"Barrinho": 1},
    {"Iva Nike Nilson": 2},
    {"Ygor": 3},
    {"Ronaaldooo": 4},
    {"Nay": 5},
    {"Kung": 6},
    {"Alex": 7},
    {"P2": 8},
    {"Hildo Quetz": 9},
    {"L1": 10},
    {"L2": 11},
    {"Lucião": 13},
    {"Wythor": 12},
  ];

  void draw() {
    if (gif || stopped) {
      return;
    }
    gif = true;
    update(this);
    Duration time = Duration(seconds: 3);
    Timer(time, () {
      gif = false;
      stopped = true;
      jjothers.shuffle();
      update(this);
    });
  }

  static OrderController get to => Get.find();

  void replay() {
    jjothers = [
      {"Debs": 0},
      {"Barrinho": 1},
      {"Iva Nike Nilson": 2},
      {"Ygor": 3},
      {"Ronaaldooo": 4},
      {"Nay": 5},
      {"Kung": 6},
      {"Alex": 7},
      {"P2": 8},
      {"Hildo Quetz": 9},
      {"L1": 10},
      {"L2": 11},
      {"Lucião": 13},
      {"Wythor": 12},
    ];
    gif = false;
    stopped = false;

    update(this);
  }

  void check() {
    jjothers.removeAt(0);
    update(this);
  }

  void thanos(index) {
    jjothers.removeAt(index);
    update(this);
  }

  void upd() {
    update(this);
  }
}
