import 'dart:typed_data';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Uint8List> photos = [];
List<String> photosPaths = [];

class _HomePageState extends State<HomePage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _initialize();
  }

  void _initialize() async {
    await addPhoto(
        "https://static.tildacdn.com/tild3639-3166-4038-b462-306636653464/2937391-how-to-defin.jpg  ");
    photos = await loadPhotos();
  }

  addPhoto(String s) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    var imgName = s.substring(s.lastIndexOf('/') + 1);

    String imgPath = join(appDocDir.path, '$imgName');

    var responce = await http.get(Uri.parse(s));

    File(imgPath).writeAsBytes(responce.bodyBytes);
    photosPaths.add(imgPath);
    setState(() {
      photosPaths;
    });
  }

  Future<List<Uint8List>> loadPhotos() async {
    // print(photosPaths);
    return photosPaths.map((e) {
      Uint8List uint = File(e).readAsBytesSync();
      return uint;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photos"),
      ),
      body: Stack(
        children: [
          if (photos.isNotEmpty)
            ListView.builder(
              itemBuilder: (context, index) {
                return Image.memory(photos[index]);
              },
              itemCount: photos.length,
            )
          else
            Center(
              child: Container(
                decoration: const BoxDecoration(color: Colors.amber),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.photo),
                      Text("Photos not found"),
                    ]),
              ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      print(
                          "Photos 1234567890-098765434567898765432345678976543234567876t5re3456");
                      await addPhoto(_controller.text);
                      print(
                          "Photos 1234567890-098765434567898765432345678976543234567876t5re3456");
                      setState(() {});
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
