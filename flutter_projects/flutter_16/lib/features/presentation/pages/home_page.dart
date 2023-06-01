import 'package:flutter/material.dart';
import 'package:flutter_16/features/presentation/widgets/one_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<int> data = List.generate(20, (index) => index);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.of(context).size.width < 720
          ? ListView(
              children: [
                ...data.map(
                  (e) => OneList(
                      img: Image.asset(
                        "assets/images/1.png",
                        scale: 1,
                      ),
                      text: "HELLO WORLD!!!"),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: 500,
                  ),
                ),
                Expanded(
                    flex: 10,
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      children: [
                        ...data.map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OneList(
                                img: Image.asset(
                                  "assets/images/1.png",
                                  scale: 1,
                                ),
                                text: "HELLO WORLD!!!"),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
    );
  }
}
