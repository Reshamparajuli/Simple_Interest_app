import 'package:flutter/material.dart';
import 'package:simple_interest/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Interest',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Homepage(),
    );
  }
}
