// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// ignore_for_file: type=lint
class $PersonsTable extends Persons with TableInfo<$PersonsTable, Person> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 11, maxTextLength: 15),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _secnameMeta =
      const VerificationMeta('secname');
  @override
  late final GeneratedColumn<String> secname = GeneratedColumn<String>(
      'secname', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, age, phoneNumber, name, secname];
  @override
  String get aliasedName => _alias ?? 'persons';
  @override
  String get actualTableName => 'persons';
  @override
  VerificationContext validateIntegrity(Insertable<Person> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('secname')) {
      context.handle(_secnameMeta,
          secname.isAcceptableOrUnknown(data['secname']!, _secnameMeta));
    } else if (isInserting) {
      context.missing(_secnameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Person map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Person(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      secname: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}secname'])!,
    );
  }

  @override
  $PersonsTable createAlias(String alias) {
    return $PersonsTable(attachedDatabase, alias);
  }
}

class Person extends DataClass implements Insertable<Person> {
  final int id;
  final int age;
  final String phoneNumber;
  final String name;
  final String secname;
  const Person(
      {required this.id,
      required this.age,
      required this.phoneNumber,
      required this.name,
      required this.secname});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['age'] = Variable<int>(age);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['name'] = Variable<String>(name);
    map['secname'] = Variable<String>(secname);
    return map;
  }

  PersonsCompanion toCompanion(bool nullToAbsent) {
    return PersonsCompanion(
      id: Value(id),
      age: Value(age),
      phoneNumber: Value(phoneNumber),
      name: Value(name),
      secname: Value(secname),
    );
  }

  factory Person.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Person(
      id: serializer.fromJson<int>(json['id']),
      age: serializer.fromJson<int>(json['age']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      name: serializer.fromJson<String>(json['name']),
      secname: serializer.fromJson<String>(json['secname']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'age': serializer.toJson<int>(age),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'name': serializer.toJson<String>(name),
      'secname': serializer.toJson<String>(secname),
    };
  }

  Person copyWith(
          {int? id,
          int? age,
          String? phoneNumber,
          String? name,
          String? secname}) =>
      Person(
        id: id ?? this.id,
        age: age ?? this.age,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        name: name ?? this.name,
        secname: secname ?? this.secname,
      );
  @override
  String toString() {
    return (StringBuffer('Person(')
          ..write('id: $id, ')
          ..write('age: $age, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('name: $name, ')
          ..write('secname: $secname')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, age, phoneNumber, name, secname);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Person &&
          other.id == this.id &&
          other.age == this.age &&
          other.phoneNumber == this.phoneNumber &&
          other.name == this.name &&
          other.secname == this.secname);
}

class PersonsCompanion extends UpdateCompanion<Person> {
  final Value<int> id;
  final Value<int> age;
  final Value<String> phoneNumber;
  final Value<String> name;
  final Value<String> secname;
  const PersonsCompanion({
    this.id = const Value.absent(),
    this.age = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.name = const Value.absent(),
    this.secname = const Value.absent(),
  });
  PersonsCompanion.insert({
    this.id = const Value.absent(),
    required int age,
    required String phoneNumber,
    required String name,
    required String secname,
  })  : age = Value(age),
        phoneNumber = Value(phoneNumber),
        name = Value(name),
        secname = Value(secname);
  static Insertable<Person> custom({
    Expression<int>? id,
    Expression<int>? age,
    Expression<String>? phoneNumber,
    Expression<String>? name,
    Expression<String>? secname,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (age != null) 'age': age,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (name != null) 'name': name,
      if (secname != null) 'secname': secname,
    });
  }

  PersonsCompanion copyWith(
      {Value<int>? id,
      Value<int>? age,
      Value<String>? phoneNumber,
      Value<String>? name,
      Value<String>? secname}) {
    return PersonsCompanion(
      id: id ?? this.id,
      age: age ?? this.age,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      name: name ?? this.name,
      secname: secname ?? this.secname,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (secname.present) {
      map['secname'] = Variable<String>(secname.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonsCompanion(')
          ..write('id: $id, ')
          ..write('age: $age, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('name: $name, ')
          ..write('secname: $secname')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $PersonsTable persons = $PersonsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [persons];
}
