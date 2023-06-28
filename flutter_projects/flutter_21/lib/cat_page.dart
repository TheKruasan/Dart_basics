import 'package:flutter/material.dart';
import 'package:flutter_21/categories.dart';

late Categories categ;

class CategoryPage extends StatefulWidget {
  final Categories cat;
  const CategoryPage({
    required this.cat,
    super.key,
  });
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cat.name),
      ),
      body: Center(
        child: Container(child: Text(widget.cat.desc)),
      ),
    );
  }
}
