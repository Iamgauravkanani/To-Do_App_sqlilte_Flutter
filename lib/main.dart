import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/screens/home/views/home.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => Home(),
      },
    ),
  );
}
