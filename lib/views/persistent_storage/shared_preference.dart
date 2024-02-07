import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference extends StatefulWidget {
  const SharedPreference({super.key});

  @override
  State<SharedPreference> createState() => _SharedPreferenceState();
}

class _SharedPreferenceState extends State<SharedPreference> {
  final Future<SharedPreferences> instance = SharedPreferences.getInstance();
  late Future<int> counter;

  @override
  void initState() {
    super.initState();
    counter = instance.then((prefs) => prefs.getInt('counter') ?? 0);
  }

  Future<void> incrementCounter() async {
    final prefs = await instance;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;
    setState(() {
      this.counter = prefs.setInt("counter", counter).then((_) => counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
              "Use shared_preferences when you want to store simple data : bool, double, int, keys, string and stringList. There is no guarantee that writes will be persisted so this plugin must not be used for storing critical data", style: TextStyle(fontSize: 18.0),),
          FutureBuilder(
            future: counter,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                case ConnectionState.active:
                case ConnectionState.done:
                  return snapshot.hasError
                      ? Text("Error: ${snapshot.error}")
                      : Text("Your counter is ${snapshot.data}");
              }
            },
          ),
          TextButton(
              onPressed: () => incrementCounter(),
              child: const Text('add 1 to counter'))
        ],
      ),
    );
  }
}
