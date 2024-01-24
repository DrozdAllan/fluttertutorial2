import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertutorial2/logic/cubit/is_dark_theme.dart';
import 'package:fluttertutorial2/style.dart';

import 'views/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // TODO: firebase, firebase messaging & firebase crashlytics initialize
  // TODO: hive box initialize
  // TODO: camera initialize
  runApp(BlocProvider(
    create: (context) => IsDarkThemeCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IsDarkThemeCubit, bool>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: myTheme,
          darkTheme: myDarkTheme,
          themeMode: state ? ThemeMode.dark : ThemeMode.light,
          // TODO: make bloc listener to listen to themeMode changing by the system
          home: const Home(),
        );
      },
    );
  }
}
