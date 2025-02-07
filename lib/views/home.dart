import 'package:flutter/material.dart';
import 'package:test1/pages/my_body.dart';
import 'package:test1/pages/my_drawer.dart';

import '../pages/my_navigation_bar.dart';

class Home extends StatelessWidget {
  static const routeHome = '/home';
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("application"),
        backgroundColor: Colors.amber,
      ),
      bottomNavigationBar: MyNavigationBar(),
      drawer: MyDrawer(),
      body: MyBody(),
    );
  }
}
