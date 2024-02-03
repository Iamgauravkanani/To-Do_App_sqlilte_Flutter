import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/screens/home/views/home.dart';
import 'package:todo_app/screens/intro/views/intro.dart';
import 'package:todo_app/screens/splash/views/splash.dart';
import 'package:todo_app/screens/start/views/start.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => const Splash(),
        'intro': (ctx) => const Intro(),
        'start': (ctx) => const Start(),
        'home': (ctx) => const Home(),
      },
    ),
  );
}
