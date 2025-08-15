import 'package:flutter/material.dart';
import 'package:kicksy_kart/global_variables.dart';
import 'package:kicksy_kart/pages/home_screen.dart';
import 'package:kicksy_kart/pages/product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kicksy Kart",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellowAccent),
        primaryColor: Colors.yellow,
        textTheme: TextTheme(
          titleMedium: TextStyle(fontSize: 16),
          bodySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      home: HomeScreen(),

      debugShowCheckedModeBanner: false,
    );
  }
}
