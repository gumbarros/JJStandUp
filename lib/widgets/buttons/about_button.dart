import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.info_outline),
      onPressed: () {
        Get.dialog(AlertDialog(
          title: Text('JJ StandUps!'),
          content: const Text('Desenvolvido por Barrinho com suporte do L2 =)',),
        ));
      },
    );
  }
}
