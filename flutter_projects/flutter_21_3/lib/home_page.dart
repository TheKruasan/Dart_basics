import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_21_3/person.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

MyDatabase _myDatabase = MyDatabase();
int i = 0;
List<int> bankCards = [];
const kBankKey = 'bankKard';

class _HomePageState extends State<HomePage> {
  late FlutterSecureStorage storage;

  saveCard(List<int> bankC) async {
    await storage.write(key: kBankKey, value: jsonEncode(bankC));
  }

  Future<List<int>> loadCard() async {
    final all = await storage.read(key: kBankKey);
    print(all);
    List<int> s = [];
    List<dynamic> bank = jsonDecode(all!);
    bank.forEach((element) {
      s.add(element);
      print(element.runtimeType);1
    });

    return s;
    // print("metka 1232131");
    // return jsonDecode(all!) as List<int>;
  }

  @override
  void initState() {
    super.initState();
    storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );
    loadAllCards();
  }

  loadAllCards() async {
    print("metka 1");
    bankCards = await loadCard();
    print("metka 2");
    print(bankCards);
  }

  addPer() {
    setState(() {
      bankCards.add(199999999);
      saveCard(bankCards);
      _myDatabase.insertPerson(
        Person(
          id: i,
          age: 3,
          phoneNumber: "8 999 888 77 66",
          name: "Lesha",
          secname: "Nau",
        ),
      );
      i++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: _myDatabase.allPersonsEntities,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width - 50,
                      child: Column(
                        children: [
                          Text(
                              "${snapshot.data![index].name} ${snapshot.data![index].secname} - ${snapshot.data![index].age} лет Телефон: ${snapshot.data![index].phoneNumber} + ${snapshot.data![index].id} "),
                          FutureBuilder(
                            future: loadCard(),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.done:
                                  if (snapshot.hasData) {
                                    return Text("${snapshot.data![index]}");
                                  }
                                  return const Text("data");
                                default:
                                  return const Text("data");
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              default:
                return Text("Empty");
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _myDatabase.deletePerson(1);
            _myDatabase.deletePerson(0);
          });
          // addPer();
          // _myDatabase.
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
