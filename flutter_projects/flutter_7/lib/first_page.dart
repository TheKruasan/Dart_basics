import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  FirstPage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              Image.asset('assets/images/7292.png'),
              ListTile(
                tileColor: Colors.blue,
                subtitle: const Text('home page'),
                leading: const Icon(Icons.home),
                trailing: const Icon(Icons.arrow_forward),
                title: const Text("Home"),
                onTap: () {
                  _scaffoldKey.currentState?.closeDrawer();
                },
              ),
              ListTile(
                leading: const Icon(Icons.accessibility_rounded),
                trailing: const Icon(Icons.arrow_forward),
                title: const Text("Actors"),
                onTap: () {
                  Navigator.of(context).pushNamed('/second');
                },
              ),
            ],
          ),
        ),

        // body: SafeArea(
        //   child: Column(
        //     children: [
        //       Container(
        //         margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        //         alignment: Alignment.center,
        //         width: double.infinity,
        //         child: FloatingActionButton.extended(
        //           label: const Text("Back"),
        //           heroTag: 'butn2',
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           onPressed: () {
        //             if (Navigator.canPop(context)) Navigator.pop(context);
        //           },
        //         ),
        //       ),
        //       Container(
        //         margin: const EdgeInsets.all(10),
        //         alignment: Alignment.center,
        //         width: double.infinity,
        //         child: FloatingActionButton.extended(
        //           label: const Text("To second Page"),
        //           heroTag: 'butn2',
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           onPressed: () {
        //             Navigator.of(context).pushNamed('/second');
        //           },
        //         ),
        //       ),
        //       Container(
        //         alignment: Alignment.center,
        //         width: double.infinity,
        //         child: FloatingActionButton.extended(
        //           heroTag: 'butn3',
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           label: const Text("To third Page"),
        //           onPressed: () {
        //             Navigator.of(context).pushNamed('/third');
        //           },
        //         ),
        //       ),
        //       Container(
        //         height: 400,
        //         alignment: Alignment.center,
        //         child: const Text(
        //           "First Page",
        //           style: TextStyle(fontSize: 26),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
