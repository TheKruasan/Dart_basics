import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool isCamera = true;

List<BottomNavigationBarItem> data = [
  const BottomNavigationBarItem(label: "camera", icon: Icon(Icons.camera)),
  const BottomNavigationBarItem(label: "galery", icon: Icon(Icons.photo)),
];

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  late List<CameraDescription> cameras;
  List<XFile> album = [];
  late XFile lastImg;
  CameraController? controller;
  int i = 0;

  @override
  void initState() {
    super.initState();
    unawaited(initCamera());
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isCamera
          ? controller?.value.isInitialized == true
              ? Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(color: Colors.amber),
                      width: MediaQuery.of(context).size.width,
                      child: CameraPreview(controller!),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: IconButton(
                        iconSize: 48.0,
                        icon: const Icon(Icons.camera),
                        onPressed: () async {
                          lastImg = (await controller?.takePicture())!;
                          album.add(lastImg);
                        },
                      ),
                    )
                  ],
                )
              : const SizedBox()
          : SafeArea(
              child: ListView(
                children: [
                  ...album.map(
                    (e) => Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Image.file(
                          File(e.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            i = value;
            i == 0 ? isCamera = true : isCamera = false;
          });
        },
        currentIndex: i,
        items: data,
      ),
    );
  }

  Future<void> initCamera() async {
    cameras = await availableCameras();

    controller = CameraController(cameras[0], ResolutionPreset.max);

    await controller!.initialize();

    setState(() {});
  }
}
