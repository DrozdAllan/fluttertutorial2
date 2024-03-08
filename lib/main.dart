import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertutorial2/data/dataproviders/isar_box.dart';
import 'package:fluttertutorial2/data/dataproviders/sqflite_db.dart';
import 'package:fluttertutorial2/logic/cubit/is_dark_theme.dart';
import 'package:fluttertutorial2/style.dart';
import 'views/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // TODO: firebase, firebase messaging & firebase crashlytics initialize
  // TODO: camera initialize
  await SqfliteDb.init();
  await IsarBox.init();
//   Packages conflict if you try to use Hive & Ivar latest versions at the same time
//   await PersonBox.init();
  runApp(BlocProvider(
    create: (context) => IsDarkThemeCubit(),
    // TODO: delete this cubit and put the weather bloc
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IsDarkThemeCubit, bool>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: myTheme,
          darkTheme: myDarkTheme,
          themeMode: ThemeMode.system,
          home: const Home(),
        );
      },
    );
  }
}
