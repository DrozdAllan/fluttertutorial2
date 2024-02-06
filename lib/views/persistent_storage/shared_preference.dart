import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference extends StatefulWidget {
  const SharedPreference({super.key});

  @override
  State<SharedPreference> createState() => _SharedPreferenceState();
}

class _SharedPreferenceState extends State<SharedPreference> {
  late int? counter = 0;
  late final SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    getPrefs();
  }

  getPrefs() async {
    prefs = await SharedPreferences.getInstance();
    counter = prefs.getInt('counter');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
              "Use Shared_Preference when you want to store simple data : bool, double, int, keys, string and stringList. There is no guarantee that writes will be persisted so this plugin must not be used for storing critical data"),
          Text("your counter is : $counter")
        ],
      ),
    );
  }
}

// Future<void> _incrementCounter() async {
//   final SharedPreferences prefs = await _prefs;
//   final int counter = (prefs.getInt('counter') ?? 0) + 1;

//   setState(() {
//     _counter = prefs.setInt("counter", counter).then((bool success) {
//       return counter;
//     });
//   });
// }
