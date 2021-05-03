import 'package:flutter/material.dart';
import 'package:noboto_app/src/views/utils/size_config.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
    required this.asset,
    this.height = 115.0,
    this.width = 115.0,
  }) : super(key: key);
  final double height;
  final double width;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(height),
      width: getProportionateScreenWidth(width),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(300.0),
        child: Image.asset(asset),
      ),
    );
  }
}
