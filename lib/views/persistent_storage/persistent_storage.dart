import 'package:flutter/material.dart';
import 'package:fluttertutorial2/views/persistent_storage/hive.dart';
import 'package:fluttertutorial2/views/persistent_storage/isar.dart';
import 'package:fluttertutorial2/views/persistent_storage/shared_preference.dart';
import 'package:fluttertutorial2/views/persistent_storage/sqflite.dart';

class PersistentStorage extends StatelessWidget {
  const PersistentStorage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Persistent Storage'),
          bottom: const TabBar(tabs: [
            Tab(text: 'Shared Preferences'),
            Tab(text: 'Hive'),
            Tab(text: 'Isar'),
            Tab(text: 'SQFlite'),
          ]),
        ),
        body: const TabBarView(children: [
          SharedPreference(),
          HiveTuto(),
          IsarTuto(),
          Sqflite(),
        ]),
      ),
    );
    // TODO: shared_pref, hive & sqflite
    // https://docs.google.com/document/d/1PszdwC2pf88VMn91XCJnSUC9GtzMigHKZNAEokIQalI/edit
  }
}
