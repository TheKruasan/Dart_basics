import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;
  bool isPlay = false;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/demo_video.mp4");
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _currentSliderValue = 0;
  double? h = 500;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: h,
            child: Stack(
              children: [
                VideoPlayer(_controller),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: VideoProgressIndicator(
                    _controller,
                    allowScrubbing: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: h! / 2 - 30,
                      left: MediaQuery.of(context).size.width / 2 - 75),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.replay_10_sharp),
                        onPressed: () {
                          goBackTo10Sec();
                        },
                      ),
                      isPlay
                          ? IconButton(
                              onPressed: () {
                                _controller.play();
                                setState(() {
                                  isPlay = !isPlay;
                                });
                              },
                              icon: const Icon(Icons.play_arrow))
                          : IconButton(
                              onPressed: () {
                                _controller.pause();
                                setState(() {
                                  isPlay = !isPlay;
                                });
                              },
                              icon: const Icon(Icons.pause),
                            ),
                      IconButton(
                        icon: const Icon(Icons.forward_10),
                        onPressed: () {
                          goForwardTo10Sec();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Slider(
            value: _currentSliderValue =
                _controller.value.position.inSeconds.toDouble(),
            max: _controller.value.duration.inSeconds.toDouble(),
            divisions: _controller.value.duration.inSeconds,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                goToPos(
                  (currentPosition) => Duration(seconds: value.toInt()),
                );
                _currentSliderValue = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Future goBackTo10Sec() async =>
      goToPos((currentPosition) => currentPosition! - Duration(seconds: 10));
  Future goForwardTo10Sec() async =>
      goToPos((currentPosition) => currentPosition! + Duration(seconds: 10));

  Future goToPos(
    Duration Function(Duration? currentPosition) builder,
  ) async {
    final currentPosition = await _controller.position;
    final newPosition = builder(currentPosition);
    await _controller.seekTo(newPosition);
  }
}
