import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jj_standup/views/classicView.dart';
import 'package:jj_standup/views/settingsView.dart';
import 'package:jj_standup/views/orderView.dart';
import 'package:jj_standup/views/ygorView.dart';

class StandUpView extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        ClassicView(pageController: _pageController),
        OrderView(pageController: _pageController),
        YgorView(pageController: _pageController),
        SettingsView(pageController: _pageController)
      ],
    );
  }
}
