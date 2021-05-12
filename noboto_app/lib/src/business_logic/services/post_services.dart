import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:noboto_app/src/business_logic/models/models.dart';
import 'package:noboto_app/src/business_logic/services/product_services.dart';
import 'package:noboto_app/src/business_logic/services/user_services.dart';

Future<List<Post>> fetchPosts() async {
  final response =
  await http.get(Uri.http('52.87.230.154:5000', 'publicaciones'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Iterable list = json.decode(response.body);
    List<Post> ans = [];
    for(var post in list){
      var postDetail = await fetchPost(post['id'] as num);
      postDetail.user = await fetchUser(postDetail.userId!);
      postDetail.product = await fetchProduct(postDetail.productId!);
      postDetail.product.imageUrls = postDetail.imageUrls;
      ans.add(postDetail);
    }
    print(ans);
    return ans;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load post');
  }
}

Future<Post> fetchPost(num id) async {
  final response =
  await http.get(Uri.http('52.87.230.154:5000', 'publicacion/$id'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Post.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load post');
  }
}