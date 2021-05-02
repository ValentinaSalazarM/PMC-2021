import 'package:flutter/material.dart';
import 'package:noboto_app/src/views/ui/home_posts/components/categories.dart';
import 'package:noboto_app/src/views/ui/home_posts/components/home_header.dart';
import 'package:noboto_app/src/views/ui/home_posts/components/post_list.dart';
import 'package:noboto_app/src/views/utils/navigation.dart';

class HomePosts extends StatefulWidget {
  @override
  _HomePostsState createState() => _HomePostsState();
}

class _HomePostsState extends State<HomePosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Trueqes"),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [HomeHeader(), Categories(), PostList()],
        )
        //bottomNavigationBar: BottomNavigation(),
        );
  }
}
