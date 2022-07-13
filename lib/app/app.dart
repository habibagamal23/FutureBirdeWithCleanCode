// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:future_bride/Presention/resource/Theme.dart';

import '../Presention/resource/Routes.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); //name Constr

  static final MyApp _instance =
      MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGeneratour.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getthemeData(),
    );
  }
}
