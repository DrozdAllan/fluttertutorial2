import 'package:flutter/material.dart';
import 'package:fluttertutorial2/views/persistent_storage/shared_preference.dart';

class PersistentStorage extends StatelessWidget {
  const PersistentStorage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Persistent Storage'),
          bottom: const TabBar(tabs: [
            Tab(text: 'Shared Preferences'),
            Tab(text: 'Hive'),
            Tab(text: 'SQFlite'),
          ]),
        ),
        body: const TabBarView(children: [
          SharedPreference(),
          Text('zinzin'),
          Text('zinzin'),
        ]),
      ),
    );
    // TODO: shared_pref, hive & sqflite
    // https://docs.google.com/document/d/1PszdwC2pf88VMn91XCJnSUC9GtzMigHKZNAEokIQalI/edit
  }
}
