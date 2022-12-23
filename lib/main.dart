import 'package:assignment3_trial/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.teal,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        splashColor: Colors.black,
      ),
      useMaterial3: true,

    ),
    title: 'Assignment 3 - Written Exam',
    home: const Home(),
  ));
}

