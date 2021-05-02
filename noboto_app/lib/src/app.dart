import 'package:flutter/material.dart';
import 'package:noboto_app/src/views/ui/home.dart';
import 'package:noboto_app/src/views/utils/theme.dart';

class NobotoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Noboto',
      theme: theme(),
      home: Home(),
    );
  }
}
