import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:noboto_app/src/business_logic/models/models.dart';
import 'package:noboto_app/src/views/ui/post_detail/post_detail.dart';

class PostCard extends StatelessWidget {
  final Post post;

  PostCard(this.post);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      margin: EdgeInsets.all(5),
      elevation: 10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostDetail(post)),
                );
              },
              child: CachedNetworkImage(
                  imageUrl: post.product.imageUrls![0],
                  imageBuilder: (context, imageProvider) => Container(
                        height: 150.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                alignment: FractionalOffset.topCenter,
                                fit: BoxFit.cover)),
                      ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.product.name!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Row(
                        children: [Icon(Icons.sync_alt), Text(post.want!)],
                      ),
                      Row(
                        children: [Icon(Icons.place), Text("500 m de Casa")],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CachedNetworkImage(
                          imageUrl: post.user!.profilePictureUrl!,
                          imageBuilder: (context, imageProvider) => Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
                              ),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error)),
                      Center(
                        child: Text(post.user!.name!),
                      ),
                      Center(
                          child: Row(
                        children: [
                          Icon(Icons.star),
                          Center(child: Text("${post.user!.rating}")),
                        ],
                      ))
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
