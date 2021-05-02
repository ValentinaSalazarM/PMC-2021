import 'package:flutter/material.dart';
import 'package:noboto_app/src/views/utils/constants.dart';
import 'package:noboto_app/src/views/utils/size_config.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "Buscar",
              prefixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.all(0),
            ),
          ),
        ),
      ),
    ));
  }
}
