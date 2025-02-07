import 'package:flutter/material.dart';
import 'package:test1/routes/navigation_route.dart';
import 'package:test1/views/home.dart';
import 'package:test1/views/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: {
        NavigationRoute.home: (context) => Home()
      },
    );
  }
}
