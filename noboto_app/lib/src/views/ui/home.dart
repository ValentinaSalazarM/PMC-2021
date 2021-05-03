import 'package:flutter/material.dart';
import 'package:noboto_app/src/views/utils/navigation.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // body: cada uno ponga aquí lo que está desarrollando mientras
      bottomNavigationBar: BottomNavigation(),
    );
  }
}