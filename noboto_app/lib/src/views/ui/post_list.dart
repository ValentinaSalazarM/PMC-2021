import 'package:flutter/material.dart';
import 'package:noboto_app/src/business_logic/models/models.dart';
import 'package:noboto_app/src/views/utils/post_card.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  List<Post> posts = [
    Post(
      id: "1",
      active: true,
      product: Product(
        id: "1",
        name: "Libro de La Peste",
        description: "Libro",
        imageUrls: ["https://1.bp.blogspot.com/-NwxXKFhXQX4/WK922_LuoaI/AAAAAAAAC8Q/LbCfS2HqStA7TMVgjKDekmobS9IBv_rHQCLcB/s1600/DSC00346.jpg"]
      ),
      user: User(
        name: "Juan Gonzalez",
        profilePictureUrl: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        rating: 4.1
      )
    ),
    Post(
        id: "1",
        active: true,
        product: Product(
            id: "1",
            name: "Libro de La Peste 2",
            description: "Libro",
            imageUrls: ["https://1.bp.blogspot.com/-NwxXKFhXQX4/WK922_LuoaI/AAAAAAAAC8Q/LbCfS2HqStA7TMVgjKDekmobS9IBv_rHQCLcB/s1600/DSC00346.jpg"]
        ),
        user: User(
            name: "Juanita Gonzalez",
            profilePictureUrl: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
            rating: 4.2
        )
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index) {
            return PostCard(posts[index]);
          },
        ),
    );
  }
}
