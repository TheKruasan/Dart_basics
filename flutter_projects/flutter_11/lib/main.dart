import 'package:flutter/material.dart';
import 'package:flutter_11/images.dart';

void main() {
  runApp(MyApp());
}

// Programm show the Hero-animation example
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Demo',
      home: MainApp(),
    );
  }
}

// It is main pages class
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Img> imag = images;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //List of card of images
      body: ListView(
        children: imag
            .map(
              (image) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OpenImg(data: image),
                    ),
                  );
                },
                child: Column(
                  children: [
                    //Image
                    Hero(
                      tag: image.id,
                      child: Card(
                        margin: const EdgeInsets.only(bottom: 10, top: 10),
                        child: CircleAvatar(
                          radius: 150,
                          backgroundImage: AssetImage(image.image),
                        ),
                      ),
                    ),
                    //Text about image
                    Hero(
                      tag: '${image.id}-title',
                      child: Text(image.desc),
                    ),
                    //Button under Image
                    Hero(
                      tag: '${image.id}-button',
                      child: Material(
                        child: Container(
                          width: 50,
                          padding: const EdgeInsets.only(bottom: 20),
                          color: Colors.red,
                          child: Container(
                            padding: const EdgeInsets.only(top: 20),
                            child: const Icon(Icons.play_arrow),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

//This is class of animation page
class OpenImg extends StatelessWidget {
  //Data about image
  final Img data;

  const OpenImg({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                //Image
                Hero(
                  tag: data.id,
                  child: Image.asset(data.image),
                ),
                //Button
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Hero(
                    tag: '${data.id}-button',
                    child: Material(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        color: Colors.red,
                        child: const Icon(Icons.play_arrow),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //Text about image
            Hero(
              tag: '${data.id}-title',
              child: Material(
                child: Text(data.desc),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
