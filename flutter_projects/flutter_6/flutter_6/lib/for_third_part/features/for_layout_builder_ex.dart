import 'package:flutter/material.dart';
import 'package:flutter_6/for_third_part/parts/tab_layout.dart';

class LayoutBuilderExample extends StatefulWidget {
  const LayoutBuilderExample({super.key});

  @override
  State<LayoutBuilderExample> createState() => _LayoutBuilderExampleState();
}

class _LayoutBuilderExampleState extends State<LayoutBuilderExample> {
  final List<LayoutTab> _data = List.generate(15, (index) {
    return LayoutTab();
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.white,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // ignore: no_leading_underscores_for_local_identifiers
                double _width = constraints.constrainWidth();
                return _width > 600
                    ? ListView.builder(
                        itemCount: _data.length,
                        itemBuilder: (context, index) => _data[index],
                        scrollDirection: Axis.horizontal,
                      )
                    : ListView.builder(
                        itemCount: _data.length,
                        itemBuilder: (context, index) => _data[index],
                        scrollDirection: Axis.horizontal,
                      );
              },
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.white,
          ),
        )
      ]),
    );
  }
}
