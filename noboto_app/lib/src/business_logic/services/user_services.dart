import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:noboto_app/src/business_logic/models/models.dart';

Future<User> fetchUser(String id) async {
  final response =
  await http.get(Uri.http('52.87.230.154:5000', 'usuario/$id'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load post');
  }
}