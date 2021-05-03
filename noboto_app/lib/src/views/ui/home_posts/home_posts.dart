import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noboto_app/src/views/ui/home_posts/components/categories.dart';
import 'package:noboto_app/src/views/ui/home_posts/components/home_header.dart';
import 'package:noboto_app/src/views/ui/home_posts/components/post_list.dart';
import 'package:noboto_app/src/views/ui/user_view.dart';
import 'package:noboto_app/src/views/utils/size_config.dart';

class HomePosts extends StatefulWidget {
  @override
  _HomePostsState createState() => _HomePostsState();
}

class _HomePostsState extends State<HomePosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getProportionateScreenHeight(60),
        title: Text("Trueques"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: Color(0xFF7C7D7E),
            ),
            tooltip: 'Notificaciones',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.profile_circled,
              color: Color(0xFF7C7D7E),
            ),
            tooltip: 'Perfil',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserView()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [HomeHeader(), Categories(), PostList()],
      ),
    );
  }
}
