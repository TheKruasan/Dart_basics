import 'package:flutter/material.dart';
import 'package:flutter_21/cat_page.dart';
import 'categories.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Box<Categories>? categories;

  @override
  void initState() {
    super.initState();
    _initializeHive();
  }

  void _addCategory(String name, String decs) {
    categories?.add(Categories(name, decs));
  }

  void _initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CategoriesAdapter());

    Hive.openBox<Categories>("categories").then((value) {
      setState(() {
        categories = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categoies"),
      ),
      body: SafeArea(
        child: categories == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  ...categories!.values.map(
                    (e) => Padding(
                      padding:
                          const EdgeInsets.only(top: 5, right: 10, left: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CategoryPage(cat: e)));
                        },
                        child: Container(
                          height: 50,
                          color: Colors.amber,
                          child: Center(
                            child: Text(e.name),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            categories?.add(Categories("Artem", "Artem Russkin 20"));
          });
        },
      ),
    );
  }
}
