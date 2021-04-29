import 'package:flutter/material.dart';
import 'package:noboto_app/src/views/utils/navigation.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white10,
        body: Stack(
          children: [
            Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: size.width,
                  height: 80,
                  // color: Colors.white,
                  child: Stack(children: [
                    CustomPaint(
                      size: Size(size.width, 80),
                      painter: BNBCustomPainter(),
                    ),
                    Center(
                        heightFactor: 0.6,
                        child: FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Color(0xFF1F3A83), //#1F3A83
                          child: Icon(Icons.add),
                          elevation: 0.1,
                        )),
                    BottomNavigation(size: size)
                  ]),
                ))
          ],
        ));
  }
}
