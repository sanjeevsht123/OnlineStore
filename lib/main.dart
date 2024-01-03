import 'package:flutter/material.dart';
import 'package:onlinestore/Products/home/home_screen.dart';
import 'package:onlinestore/Products/screens/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orangeAccent,
        primarySwatch: Colors.orange,
        
      ),
      home: Home_screen(),
    );
    
  }
}
