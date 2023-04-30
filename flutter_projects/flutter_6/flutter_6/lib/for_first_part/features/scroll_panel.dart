import 'package:flutter/material.dart';
// import 'package:flutter_6/for_first_part/parts/scroll_tab_1.dart';
import 'package:flutter_6/for_first_part/parts/scroll_tab_2.dart';

class ScrollTutorial extends StatefulWidget {
  const ScrollTutorial({super.key});

  @override
  State<ScrollTutorial> createState() => _ScrollTutorialState();
}

class _ScrollTutorialState extends State<ScrollTutorial> {
  final ScrollController controller = ScrollController();
  List<ScrollTabState> scrollTabs = List.generate(27, (index) {
    return ScrollTabState(
      title: index.toString(),
      icon: Icons.favorite,
    );
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          controller: controller,
          children: [for (var item in scrollTabs) item],
        ),
      ),
    );
  }
}
