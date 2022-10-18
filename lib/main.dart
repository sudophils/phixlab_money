import 'package:flutter/material.dart';
import 'package:phixlab_money/screens/main_screens_host.dart';
import 'package:phixlab_money/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: background),
        brightness: Brightness.light,
      ),
      home: const MainScreenHost(),
    );
  }
}
