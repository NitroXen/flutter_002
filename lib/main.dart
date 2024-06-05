import 'package:flutter/material.dart';
import 'package:flutter_002/screens/add_screen.dart';
import 'package:flutter_002/screens/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Implementar Splach Screen
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => MainScreen(),
      },
    );
  }
}
