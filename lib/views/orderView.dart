import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jj_standup/controllers/orderController.dart';
import 'package:jj_standup/widgets/buttons/button.dart';
import 'package:jj_standup/widgets/drawer/drawer.dart';

class OrderView extends StatelessWidget {
  final PageController pageController;

  OrderView({@required this.pageController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        init: OrderController(),
        builder: (_) => DefaultTabController(
              length: 2,
              child: Scaffold(
                  appBar: AppBar(
                    elevation: 5,
                    title: Text(
                      "JJ Stand Up",
                    ),
                    centerTitle: true,
                    actions: <Widget>[
                      _.stopped
                          ? Row(children: <Widget>[
                              _.jjothers.isNotEmpty
                                  ? IconButton(
                                      icon: Icon(Icons.check),
                                      onPressed: () {
                                        _.check();
                                      },
                                    )
                                  : SizedBox.shrink(),
                              IconButton(icon: Icon(Icons.replay), onPressed: _.replay),
                            ])
                          : SizedBox.shrink(),
                    ],
                    bottom: TabBar(
                      indicatorColor: Color.fromRGBO(237, 134, 0, 1),
                      tabs: <Tab>[
                        Tab(
                          icon: Icon(Icons.list),
                        ),
                        Tab(
                          icon: Icon(Icons.grid_on),
                        )
                      ],
                    ),
                  ),
                  drawer: JJDrawer(pageController),
                  body: TabBarView(
                    children: [
                      Container(
                          child: Visibility(
                        visible: _.stopped,
                        replacement: _buildRandomizer(),
                        child: Visibility(
                            replacement: _buildGoodWork(context),
                            visible: _.jjothers.isNotEmpty,
                            child: _buildListView()),
                      )),
                      Container(
                          child: Visibility(
                        visible: _.stopped,
                        replacement: _buildRandomizer(),
                        child: Visibility(
                            replacement: _buildGoodWork(context),
                            visible: _.jjothers.isNotEmpty,
                            child: _buildGridView()),
                      ))
                    ],
                  )),
            ));
  }

  GetBuilder _buildRandomizer() {
    return GetBuilder<OrderController>(
      builder: (_) => Container(
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
                                  ? "lib/assets/images/jj_${_.number}.png"
                                  : Get.isDarkMode
                                      ? "lib/assets/images/default_dark.png"
                                      : "lib/assets/images/default.png")))),
                ),
                Container(
                    width: Get.mediaQuery.size.width / 2.5,
                    height: Get.mediaQuery.size.height / 12,
                    child: StandUpButton(
                      !_.gif ? "Sortear" : "Sorteiooo...",
                      onPressed: _.draw,
                    )),
              ])),
    );
  }

  GetBuilder _buildListView() {
    return GetBuilder<OrderController>(
      builder: (_) => ListView.builder(
        itemCount: _.jjothers.length,
        itemBuilder: (context, index) {
          return Dismissible(
              key: Key(_.jjothers[index].keys.first),
              onDismissed: (direction) {
                _.jjothers.removeAt(index);
                _.upd();
              },
              child: Container(
                  width: Get.width,
                  child: Card(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: Get.height / 6,
                        width: Get.width / 3,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(
                                    "lib/assets/images/jj_${_.jjothers[index].values.first}.png"))),
                      ),
                      Container(
                        child: Text("${_.jjothers[index].keys.first}",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Theme.of(context).textTheme.headline6.color)),
                      ),
                      Container(
                        child: Text(""),
                      )
                    ],
                  ))));
        },
      ),
    );
  }

  GetBuilder _buildGridView() {
    return GetBuilder<OrderController>(
      builder: (_) => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: _.jjothers.length,
        itemBuilder: (context, index) {
          return Container(
              width: Get.width,
              child: Card(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: Get.height / 6,
                    width: Get.width / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(
                                "lib/assets/images/jj_${_.jjothers[index].values.first}.png"))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text("${_.jjothers[index].keys.first}",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).textTheme.headline6.color)),
                    ),
                  ),
                ],
              )));
        },
      ),
    );
  }

  Container _buildGoodWork(BuildContext context) {
    return Container(
        height: Get.mediaQuery.size.height - 56,
        width: Get.mediaQuery.size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.favorite,
                  size: 150,
                  color: Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor),
              Text(
                "Bom trabalho a todos!",
                style: TextStyle(
                    fontSize: 20, color: Theme.of(context).textTheme.headline6.color),
              )
            ]));
  }
}
