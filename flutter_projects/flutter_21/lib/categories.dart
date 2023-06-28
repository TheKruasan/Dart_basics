import 'package:hive/hive.dart';

part 'categories.g.dart';

@HiveType(typeId: 0)
class Categories extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String desc;

  Categories(this.name, this.desc);
}
