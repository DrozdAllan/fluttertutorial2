import 'package:flutter/material.dart';

import 'views/home.dart';

void main() {
  // TODO: firebase, firebase messaging & firebase crashlytics initialize
  // TODO: hive box initialize
  // TODO: camera initialize
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //   debugShowCheckedModeBanner: false,
      // TODO: theme
      //   theme: myTheme,
      home: Home(),
    );
  }
}
