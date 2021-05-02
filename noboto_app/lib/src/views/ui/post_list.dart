import 'package:flutter/material.dart';
import 'package:noboto_app/src/business_logic/models/models.dart';
import 'package:noboto_app/src/views/utils/post_card.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  List<Post> posts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trueqes"),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return PostCard(posts[index]);
        },
      ),
    );
  }
}
