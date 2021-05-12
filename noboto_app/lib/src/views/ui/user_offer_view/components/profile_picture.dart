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
        child: Image(
          image: AssetImage(asset),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class DoubleProfilePic extends StatelessWidget {
  const DoubleProfilePic({
    Key? key,
    required this.firstAsset,
    required this.secondAsset,
    this.height = 115.0,
    this.width = 115.0,
  }) : super(key: key);

  final double height;
  final double width;
  final String firstAsset;
  final String secondAsset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(height),
      width: getProportionateScreenWidth(width * 1.4),
      child: Stack(
        // fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFFAFAFA),
              borderRadius: BorderRadius.circular(360),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFC2C2C2),
                  offset: const Offset(
                    3.0,
                    3.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            height: getProportionateScreenWidth(width),
            width: getProportionateScreenWidth(width),
            child: ClipOval(
              child: Image(
                image: AssetImage(firstAsset),
                height: getProportionateScreenWidth(width),
                width: getProportionateScreenWidth(width),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: getProportionateScreenWidth(width * 0.4),
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFAFAFA),
                borderRadius: BorderRadius.circular(360),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFC2C2C2),
                    offset: const Offset(
                      3.0,
                      3.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              height: getProportionateScreenWidth(width),
              width: getProportionateScreenWidth(width),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(360.0),
                child: Image(
                  image: AssetImage(secondAsset),
                  height: getProportionateScreenWidth(width),
                  width: getProportionateScreenWidth(width),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: getProportionateScreenWidth(width * 0.7 - 15),
            bottom: 0,
            child: Image(
              image: AssetImage('assets/icons/exchange.png'),
              width: getProportionateScreenWidth(24),
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
