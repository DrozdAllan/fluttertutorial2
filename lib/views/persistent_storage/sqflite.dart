import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertutorial2/data/dataproviders/sqflite_db.dart';
import 'package:fluttertutorial2/data/models/dog.dart';
import 'package:sqflite/sqflite.dart';

class Sqflite extends StatefulWidget {
  const Sqflite({super.key});

  @override
  State<Sqflite> createState() => _SqfliteState();
}

class _SqfliteState extends State<Sqflite> {
  late String? databasePath;
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
        const Text('Salut ici c\'est Sqflite'),
        SizedBox(
          height: 350.0,
          child: FutureBuilder<List<Dog>>(
            future: SqfliteDb.instance.getDogs(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: Text('Loading...'),
                );
              }
              return snapshot.data!.isEmpty
                  ? const Center(
                      child: Text('No dogs'),
                    )
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
            },
          ),
        ),
        const Text("Add a Dog"),
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
            onPressed: () async {
              await SqfliteDb.instance
                  .addDog(Dog(id: 666, name: _name.text, age: 28));
              setState(() {
                _name.clear();
              });
            },
            child: const Text("Add the dog"))
      ]),
    );
  }
}
