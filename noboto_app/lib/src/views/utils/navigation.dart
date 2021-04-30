import 'package:flutter/material.dart';
import 'package:noboto_app/src/views/utils/app_icons.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
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
                Container(
                  width: size.width,
                  height: 80,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(children: [
                          IconButton(
                            icon: Icon(AppIcons.exchange_alt),
                            onPressed: () {},
                          ),
                          Text('Trueques')
                        ]),
                        Column(children: [
                          IconButton(
                            icon: Icon(AppIcons.gift),
                            onPressed: () {},
                          ),
                          Text('Donaciones')
                        ]),
                        Container(
                          width: size.width * 0.2,
                        ),
                        Column(children: [
                          IconButton(
                            icon: Icon(AppIcons.hand_holding),
                            onPressed: () {},
                          ),
                          Text('Solicitudes')
                        ]),
                        Column(children: [
                          IconButton(
                            icon: Icon(Icons.messenger_rounded),
                            onPressed: () {},
                          ),
                          Text('Mensajes')
                        ])
                      ]),
                )
              ]),
            ))
      ],
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 0);
    // path.quadraticBezierTo(size.width * 0.20, 0,size.width * 0.35, 0);
    path.lineTo(size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    // path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
