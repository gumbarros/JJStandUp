import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jj_standup/controllers/themeController.dart';
import 'package:jj_standup/widgets/buttons/about_button.dart';
import 'package:jj_standup/widgets/drawer/drawer.dart';

class SettingsView extends StatelessWidget {
  final PageController pageController;
  SettingsView({@required this.pageController});

  final ThemeController theme = Get.put(ThemeController()); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text("JJ StandUp",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            )),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[AboutButton()],
      ),
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            activeColor: Colors.orange,
            value: Get.isDarkMode,
            title: Text("Modo Noturno"),
            onChanged: (value) {
             if(Get.isDarkMode) theme.setThemeMode(ThemeMode.light);
             else theme.setThemeMode(ThemeMode.dark);
            },
          ),
          ListTile(title: Text("Versão 3.0.0 - Iva Nike Nilson",style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0)))
        ],
      ),
      drawer: JJDrawer(pageController),
    );
  }
}
