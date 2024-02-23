// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'cat.g.dart';

@collection
class Cat {
  Id id = Isar.autoIncrement;

  String name;

  int age;

  Cat({
    required this.name,
    required this.age,
  });
}
