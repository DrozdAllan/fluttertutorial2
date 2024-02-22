import 'package:hive/hive.dart';

// part 'person.g.dart';

@HiveType(typeId: 0)
class Person extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  int age;
  @HiveField(2)
  List<Person>? friends;

  Person(
    this.name,
    this.age,
    this.friends,
  );
}
