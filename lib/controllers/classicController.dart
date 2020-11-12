import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';

class ClassicController extends GetController {
  bool stopped = false;
  bool gif = false;
  int number;
  final List<String> jjothers = [
    "Debs",
    "Barrinho",
    "Iva Nike Son",
    "Ygor",
    "Ronaaldooo",
    "Nay",
    "Kung",
    "Alex",
    "P2",
    "Hildo Quetz",
    "L1",
    "L2",
    "Lucião",
    "Wythor"
  ];

  void draw() {
    final Random random = new Random();
    if (gif || stopped) {
      return;
    }
    gif = true;
    update(this);
    Duration time = Duration(seconds: 3);
    Timer(time, () {
      gif = false;
      stopped = true;
      number = random.nextInt(13);
      update(this);
    });
  }

  static ClassicController get to => Get.find();

  void replay() {
    stopped = false;
    gif = false;
    update(this);
  }

  void upd() {
    update(this);
  }
}
