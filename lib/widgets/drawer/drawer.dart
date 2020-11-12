import 'package:flutter/material.dart';
import 'package:jj_standup/widgets/drawer/drawer_tile.dart';

class JJDrawer extends StatelessWidget {
  final PageController pageController;

  JJDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(left: 32.0, top: 16.0),
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 8.0),
            padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 0.0),
            height: 50.0,
          ),
          Container(
            padding: EdgeInsets.only(),
            child: Text(
              "JJ Stand Up",
              style: TextStyle(
                  fontSize: 34.0, color: Theme.of(context).textTheme.headline6.color),
            ),
          ),
          Divider(),
          DrawerTile(Icons.camera_front, "Sorteio Clássico", pageController, 0),
          DrawerTile(Icons.list, "Ordenar Pessoas", pageController, 1),
          DrawerTile(Icons.favorite, "Meu Amigo Ygor", pageController, 2),
          DrawerTile(Icons.settings, "Configurações", pageController, 3),
        ],
      ),
    );
  }
}
