import 'package:hive_flutter/hive_flutter.dart';
import 'person.dart';

class PersonBox {
  static Box<Person>? box;

  static final List<Person> persons = [
    Person('Allan', 29, [Person('Benjamin', 29, [])]),
    Person('Benjamin', 29, [Person('Benjamin', 29, [])]),
    Person('Suzie', 2, [])
  ];

  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(PersonAdapter());

    box = await Hive.openBox('PersonBox');

    // box?.clear();
    // verify the state of the box on the app
    var values = box?.values;
    if (values == null || values.isEmpty) {
      // populate the box if it's the first time the app is built
      box?.addAll(persons);
    }
  }
}
