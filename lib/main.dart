import 'package:flutter/material.dart';
import 'package:shirin_sanjar_lessons/function.dart';
import 'package:shirin_sanjar_lessons/if_screen.dart';
import 'package:shirin_sanjar_lessons/lesson03.dart';
import 'package:shirin_sanjar_lessons/to_do_app/to_do_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ToDoScreen(),
    );
  }
}


