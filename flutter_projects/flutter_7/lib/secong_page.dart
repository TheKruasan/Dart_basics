import 'package:flutter/material.dart';
import 'package:flutter_7/actor.dart';
import 'package:flutter_7/actors_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});
  static const String routeName = "/second";
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _controller = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<List> futureActors = fetchActor();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Actors"),
      ),
      body: FutureBuilder(
        future: futureActors,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!
                  .map((e) => ListTile(
                        title: Text(e.name),
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('/actors', arguments: {
                            'actor': e,
                          });
                        },
                      ))
                  .toList(),
            );
          }
          return const Text("Loading");
        },
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Image.asset('assets/images/7292.png'),
            ListTile(
              subtitle: const Text('home page'),
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.arrow_forward),
              title: const Text("Home"),
              onTap: () {
                Navigator.of(context).pushNamed("/first");
              },
            ),
            ListTile(
              tileColor: Colors.blue,
              leading: const Icon(Icons.accessibility_rounded),
              trailing: const Icon(Icons.arrow_forward),
              title: const Text("Actors"),
              onTap: () {
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
