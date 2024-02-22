import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertutorial2/data/dataproviders/isar_box.dart';
import 'package:fluttertutorial2/data/models/person/person.dart';
import 'package:fluttertutorial2/data/dataproviders/person_box.dart';
import 'package:hive_flutter/hive_flutter.dart';

class IsarTuto extends StatefulWidget {
  const IsarTuto({super.key});

  @override
  State<IsarTuto> createState() => _IsarTutoState();
}

class _IsarTutoState extends State<IsarTuto> {
  Box<Person>? box = PersonBox.box;
  final GlobalKey<FormFieldState> _formFieldKey = GlobalKey<FormFieldState>();
  final _name = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const Text('Salut ici c\'est Isar'),
        SizedBox(
          height: 350.0,
          child: FutureBuilder(
            future: IsarBox.instance.getCats(),
            builder: (_, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                case ConnectionState.active:
                case ConnectionState.done:
                  return snapshot.hasError
                      ? Text("Error: ${snapshot.error}")
                      : ListView(
                          children: snapshot.data!
                              .map(
                                (dog) => Center(
                                  child: ListTile(
                                    title: Text(dog.name),
                                  ),
                                ),
                              )
                              .toList(),
                        );
              }
            },
          ),
        ),
        const Text("Add a Person"),
        TextFormField(
          key: _formFieldKey,
          controller: _name,
          textAlign: TextAlign.start,
          decoration: const InputDecoration(
              label: Center(child: Text('Name')), border: OutlineInputBorder()),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a name';
            }
            return null;
          },
        ),
        OutlinedButton(
            onPressed: () {
              addToBox();
            },
            child: const Text("Add"))
      ]),
    );
  }

  addToBox() {
    print(_name.value.text);
    Person newEntry = Person(_name.value.text, 18, null);
    // add new entry to box
    box!.add(newEntry);
    print(box!.get(3)!.age);
    // update entry in the box
    newEntry.age = 24;
    newEntry.save();
    print(box!.get(3)!.age);
    // delete entry from the box
    newEntry.delete();
    print(box!.get(3));
  }
}
