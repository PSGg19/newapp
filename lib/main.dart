import 'package:flutter/material.dart';
import 'main_screen.dart'; // Import the MainScreen widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(), // Set MainScreen as the home widget
    );
  }
}
