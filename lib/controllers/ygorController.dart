import 'dart:async';
import 'package:get/get.dart';

class YgorController extends GetController {
  bool stopped = false;
  bool gif = false;

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
      update(this);
    });
  }

  static YgorController get to => Get.find();

  void replay() {
    stopped = false;
    gif = false;
    update(this);
  }

  void upd() {
    update(this);
  }
}
