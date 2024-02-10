import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertutorial2/data/models/person/person.dart';
import 'package:fluttertutorial2/data/models/person/person_box.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveTuto extends StatefulWidget {
  const HiveTuto({super.key});

  @override
  State<HiveTuto> createState() => _HiveTutoState();
}

class _HiveTutoState extends State<HiveTuto> {
  var box = PersonBox.box;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const Text('Salut ici c\'est Hive'),
        ValueListenableBuilder(
          valueListenable: box!.listenable(),
          builder: (_, value, child) {
            List<dynamic> personList = box!.values.toList();
            inspect(personList);
            return SizedBox(
              height: 450.0,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => ListTile(
                  title: Text(personList.elementAt(index).name),
                ),
              ),
            );
          },
        )
      ]),
    );
  }
}
