import 'package:flutter/material.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: Colors.amber,
      destinations: [
        NavigationDestination(icon: Icon(Icons.phone), label: "Appel"),
        NavigationDestination(icon: Icon(Icons.phone), label: "Appel"),
        NavigationDestination(icon: Icon(Icons.phone), label: "Appel"),
        NavigationDestination(icon: Icon(Icons.phone), label: "Appel"),
        NavigationDestination(icon: Icon(Icons.phone), label: "Appel"),
      ],
    );
  }
}
