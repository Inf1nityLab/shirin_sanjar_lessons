import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shirin_sanjar_lessons/lesson09/bottom_screen.dart';
import 'package:shirin_sanjar_lessons/lesson09/lesson09.dart';
import 'package:shirin_sanjar_lessons/lesson10/lesson10.dart';
import 'package:shirin_sanjar_lessons/lesson10/page_screen.dart';
import 'package:shirin_sanjar_lessons/lesson11/data_class.dart';
import 'package:shirin_sanjar_lessons/profile/compas/compas.dart';
import 'package:shirin_sanjar_lessons/profile/model/person_model.dart';
import 'package:shirin_sanjar_lessons/profile/screens/profile_screen.dart';

import 'package:shirin_sanjar_lessons/to_do_app/to_do_screen.dart';

import 'lesson10/flu.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PersonModelAdapter());
  compasLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  ProfilScreen(),
    );
  }
}




