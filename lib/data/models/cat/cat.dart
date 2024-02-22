import 'package:isar/isar.dart';

part 'cat.g.dart';

@collection
class Cat {
  Id id = Isar.autoIncrement;

  String? name;

  int? age;
}
