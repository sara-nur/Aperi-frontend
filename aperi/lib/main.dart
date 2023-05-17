import 'package:flutter/material.dart';
import 'package:aperi/screens/home_page.dart';
//import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aperi',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const HomeScreen(),
    );
  }
}
