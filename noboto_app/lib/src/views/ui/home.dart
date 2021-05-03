import 'package:flutter/material.dart';
import 'package:noboto_app/src/views/ui/coming_soon_view.dart';
import 'package:noboto_app/src/views/ui/home_posts/home_posts.dart';
import 'package:noboto_app/src/views/ui/user_offer_view.dart';
import 'package:noboto_app/src/views/ui/user_view.dart';
import 'package:noboto_app/src/views/utils/app_icons.dart';
import 'package:noboto_app/src/views/utils/navigation.dart';
import 'package:noboto_app/src/views/utils/size_config.dart';
// import 'package:noboto_app/src/views/utils/navigation.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screens = [
    HomePosts(),
    ComingSoonView(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePosts();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageStorage(bucket: bucket, child: currentScreen),
      // bottomNavigationBar: BottomNavigation(),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        height: 80,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                color: Colors.transparent,
                width: size.width,
                child: Stack(
                  children: [
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
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      width: size.width,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Icon(
                                  AppIcons.exchange_alt,
                                  color: currentTab == 0
                                      ? Color(0xFF1F3A83)
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    currentTab = 0;
                                    currentScreen = HomePosts();
                                  });
                                },
                              ),
                              Text(
                                'Trueques',
                                style: TextStyle(
                                  color: currentTab == 0
                                      ? Color(0xFF1F3A83)
                                      : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Icon(
                                  AppIcons.gift,
                                  color: currentTab == 1
                                      ? Color(0xFF1F3A83)
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    currentTab = 1;
                                    currentScreen = ComingSoonView();
                                  });
                                },
                              ),
                              Text(
                                'Donaciones',
                                style: TextStyle(
                                  color: currentTab == 1
                                      ? Color(0xFF1F3A83)
                                      : Colors.grey,
                                ),
                              )
                            ],
                          ),
                          Container(
                            width: size.width * 0.2,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Icon(
                                  AppIcons.hand_holding,
                                  color: currentTab == 2
                                      ? Color(0xFF1F3A83)
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    currentTab = 2;
                                    currentScreen = ComingSoonView();
                                  });
                                },
                              ),
                              Text(
                                'Solicitudes',
                                style: TextStyle(
                                  color: currentTab == 2
                                      ? Color(0xFF1F3A83)
                                      : Colors.grey,
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.messenger_rounded,
                                  color: currentTab == 3
                                      ? Color(0xFF1F3A83)
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    currentTab = 3;
                                    currentScreen = ComingSoonView();
                                  });
                                },
                              ),
                              Text(
                                'Mensajes',
                                style: TextStyle(
                                  color: currentTab == 3
                                      ? Color(0xFF1F3A83)
                                      : Colors.grey,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// BottomAppBar(
//         shape: const CircularNotchedRectangle(),
//         elevation: 5,
//         notchMargin: 10,
//         child: Container(
//           height: 60.0,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               MaterialButton(
//                 onPressed: () {
//                   setState(() {
//                     // currentScreen = HomePosts();
//                     // currentTab = 0;
//                   });
//                 },
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(AppIcons.exchange_alt,
//                         color:
//                             currentTab == 0 ? Color(0xFF1F3A83) : Colors.grey),
//                     Text(
//                       'Trueque',
//                       style: TextStyle(
//                           color: currentTab == 0
//                               ? Color(0xFF1F3A83)
//                               : Colors.grey),
//                     ),
//                   ],
//                 ),
//               ),
//               MaterialButton(
//                 onPressed: () {
//                   setState(() {
//                     // currentScreen = HomePosts();
//                     // currentTab = 1;
//                   });
//                 },
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(AppIcons.gift,
//                         color:
//                             currentTab == 1 ? Color(0xFF1F3A83) : Colors.grey),
//                     Text(
//                       'Donación',
//                       style: TextStyle(
//                           color: currentTab == 1
//                               ? Color(0xFF1F3A83)
//                               : Colors.grey),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(),
//               MaterialButton(
//                 onPressed: () {
//                   setState(
//                     () {
//                       // currentScreen = HomePosts();
//                       // currentTab = 2;
//                     },
//                   );
//                 },
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(AppIcons.hand_holding,
//                         color:
//                             currentTab == 2 ? Color(0xFF1F3A83) : Colors.grey),
//                     Text(
//                       'Solicitud',
// style: TextStyle(
//     color: currentTab == 2
//         ? Color(0xFF1F3A83)
//         : Colors.grey),
//                     ),
//                   ],
//                 ),
//               ),
//               MaterialButton(
//                 onPressed: () {
//                   setState(() {
//                     // currentScreen = UserView();
//                     // currentTab = 3;
//                   });
//                 },
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.messenger_rounded,
//                         color:
//                             currentTab == 3 ? Color(0xFF1F3A83) : Colors.grey),
//                     Text(
//                       'Mensajes',
//                       style: TextStyle(
//                           color: currentTab == 3
//                               ? Color(0xFF1F3A83)
//                               : Colors.grey),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => {},
//         child: const Icon(Icons.add),
//         backgroundColor: Color(0xFF1F3A83),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
