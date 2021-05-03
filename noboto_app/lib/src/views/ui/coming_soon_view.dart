import 'package:flutter/material.dart';

class ComingSoonView extends StatelessWidget {
  const ComingSoonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // body: cada uno ponga aquí lo que está desarrollando mientras
        //bottomNavigationBar: BottomNavigation(),

        body: Stack(children: <Widget>[
          Center(
            child: Image(
              image: AssetImage('assets/images/splash_background.png'),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Positioned.fill(
            child: Image(
              image: AssetImage('assets/images/logo_noboto.png'),
              alignment: Alignment(0, -0.5),
            ),
          ),
          Center(
              child: Text(
            'Coming Soon',
            style: TextStyle(
                fontSize: 50, color: Colors.black, fontFamily: 'Metropolis'),
          )),
        ]));
  }
}
