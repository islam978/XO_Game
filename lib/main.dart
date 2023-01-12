import 'package:flutter/material.dart';
import 'package:xo_game/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'XO',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0XFF00061a),
        splashColor: const Color(0XFF4169e8),
        secondaryHeaderColor: const Color(0XFF001456),
        primarySwatch: Colors.blue,

      ),
      home: HomeScreen(),
    );
  }
}

