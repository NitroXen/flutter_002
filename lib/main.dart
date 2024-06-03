import 'package:flutter/material.dart';
import 'package:flutter_002/screens/main_screen.dart';
import 'package:flutter_002/screens/second_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => MainScreen(),
      },
    );
  }
}