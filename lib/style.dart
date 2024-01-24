import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.teal, brightness: Brightness.light));

ThemeData myDarkTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.red, brightness: Brightness.dark));
