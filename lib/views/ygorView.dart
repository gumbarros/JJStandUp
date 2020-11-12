import 'package:get/get.dart';
import 'package:jj_standup/controllers/classicController.dart';
import 'package:flutter/material.dart';
import 'package:jj_standup/widgets/buttons/button.dart';
import 'package:jj_standup/widgets/drawer/drawer.dart';

class YgorView extends StatelessWidget {
  final PageController pageController;

  YgorView({@required this.pageController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassicController>(
        init: ClassicController(),
        builder: (_) => Scaffold(
            appBar: AppBar(
              elevation: 5,
              title: Text(
                "JJ Stand Up",
              ),
              centerTitle: true,
              actions: <Widget>[
                _.stopped
                    ? IconButton(
                        icon: Icon(Icons.replay),
                        onPressed: () {
                          _.replay();
                        })
                    : SizedBox.shrink(),
              ],
            ),
            drawer: JJDrawer(pageController),
            body: Container(
                height: Get.mediaQuery.size.height - 56,
                width: Get.mediaQuery.size.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: Get.mediaQuery.size.width / 1.9,
                        height: Get.mediaQuery.size.height / 3.2,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(_.gif
                                    ? "lib/assets/images/jj.gif"
                                    : (_.stopped
                                        ? "lib/assets/images/jj_3.png"
                                        : Get.isDarkMode
                                            ? "lib/assets/images/default_dark.png"
                                            : "lib/assets/images/default.png")))),
                      ),
                      Container(
                          width: (_.stopped
                              ? Get.mediaQuery.size.width / 1.5
                              : Get.mediaQuery.size.width / 2.5),
                          height: (_.stopped
                              ? Get.mediaQuery.size.height / 10
                              : Get.mediaQuery.size.height / 12),
                          child: StandUpButton(
                            _.stopped
                                ? "Ygor foi sorteado!"
                                : (_.gif ? "Sorteioo..." : "Sortear!"),
                            onPressed: _.draw,
                          )),
                    ]))));
  }
}
