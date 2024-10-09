import 'package:flutter/material.dart';
import 'package:sqflite_project/controller/home_screen_controller.dart';
import 'package:sqflite_project/view/home_screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HomeScreenController.initdb();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
