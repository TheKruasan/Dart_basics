import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return (runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  _MyApp createState() => _MyApp();
}

class TabItem {
  String title;
  Icon icon;
  TabItem(this.title, this.icon);
}

final List<TabItem> _tabBar = [
  TabItem(
    "Home",
    Icon(Icons.home),
  ),
  TabItem(
    "Chat",
    Icon(Icons.chat),
  ),
  TabItem(
    "Album",
    Icon(Icons.album),
  ),
];

class Tile {
  String title;
  Icon icon;
  Icon backIcon = const Icon(Icons.arrow_forward);
  Tile(this.title, this.icon);
}

final List<Tile> _drawerPole = [
  Tile("Profile", const Icon(Icons.person)),
  Tile("Images", const Icon(Icons.image)),
  Tile("Files", const Icon(Icons.file_copy))
];

class _MyApp extends State<MyApp> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? _controller;
  late TabController _tabController;
  int _currentTabIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Demo flutter"),
          ),
          body: TabBarView(controller: _tabController, children: [
            Container(
              color: Colors.green,
              child: const Center(
                child: Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.red,
              child: const Center(
                child: Text(
                  "Chat",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.yellow,
              child: const Center(
                child: Text(
                  "Album",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ]),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _currentTabIndex = index;
                _tabController.index = index;
              });
            },
            currentIndex: _currentTabIndex,
            items: [
              for (final item in _tabBar)
                BottomNavigationBarItem(
                  icon: item.icon,
                  label: item.title,
                ),
            ],
          ),
          drawer: Drawer(
            backgroundColor: Colors.white,
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    flex: 9,
                    child: Column(children: [
                      CircleAvatar(
                        radius: 90,
                        child: Image.asset("assets/images/1-round.png"),
                      ),
                      for (var item in _drawerPole)
                        ListTile(
                          leading: item.icon,
                          title: Text(item.title),
                          trailing: item.backIcon,
                        ),
                    ]),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FloatingActionButton.extended(
                        backgroundColor: Colors.grey,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        label: const Text("Регистрация"),
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.grey,
                            style: BorderStyle.none,
                            strokeAlign: BorderSide.strokeAlignCenter,
                          ),
                        ),
                      ),
                      FloatingActionButton.extended(
                        backgroundColor: Colors.grey,
                        onPressed: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        label: const Text("Вход"),
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.grey,
                            style: BorderStyle.none,
                            strokeAlign: BorderSide.strokeAlignCenter,
                          ),
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              //print("Press the button");
              showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 200,
                      child: Center(
                          child: Column(children: [
                        const ListTile(
                          leading: Icon(Icons.credit_card),
                          title: Text('Сумма'),
                          trailing: Text('200 руб.'),
                        ),
                        ElevatedButton(
                          child: const Text('Оплатить'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ])),
                    );
                  });
            },
          ),
        );
      }),
    );
  }
}
