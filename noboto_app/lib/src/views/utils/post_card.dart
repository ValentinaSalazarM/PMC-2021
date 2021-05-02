import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:noboto_app/src/business_logic/models/models.dart';
import 'package:noboto_app/src/views/utils/app_icons.dart';



class PostCard extends StatelessWidget {

  final Post post;

  PostCard(this.post);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(5),
      elevation: 10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Column(
          children: [
            CachedNetworkImage(
                imageUrl: post.object!.imageUrls![0],
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error)),
            Row(
              children: [
                Column(
                  children: [
                    Text(post.object!.name!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                    Row(
                      children: [

                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
