import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

part "person.g.dart";

class Persons extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get age => integer()();
  TextColumn get phoneNumber => text().withLength(min: 11, max: 15)();
  TextColumn get name => text().withLength(min: 2, max: 20)();
  TextColumn get secname => text().withLength(min: 2, max: 20)();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Persons])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  Future<List<Person>> get allPersonsEntities => select(persons).get();
  Future<int> insertPerson(Person person) => into(persons).insert(person);
  Future<int> deletePerson(int id) =>
      (delete(persons)..where((t) => t.id.isValue(id))).go();

  @override
  int get schemaVersion => 1;
}
