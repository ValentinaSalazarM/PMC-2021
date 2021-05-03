import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noboto_app/src/views/utils/size_config.dart';

class ColoredIndicator extends StatelessWidget {
  const ColoredIndicator({
    Key? key,
    required this.asset,
    required this.color,
    required this.text,
  }) : super(key: key);

  final String asset;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: SizedBox(
            height: getProportionateScreenWidth(25),
            width: getProportionateScreenWidth(25),
            child: SvgPicture.asset(
              asset,
              color: color,
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Color(0xFF7C7D7E),
            fontFamily: "Metropolis",
            fontSize: getProportionateScreenWidth(13),
          ),
        ),
      ],
    );
  }
}

class BlueIconIndicator extends StatelessWidget {
  const BlueIconIndicator({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          icon,
          color: Color(0xFF1F3A83),
          size: getProportionateScreenWidth(17),
        ),
        Text(
          text,
          style: TextStyle(
            color: Color(0xFF1F3A83),
            fontFamily: "Metropolis",
            fontSize: getProportionateScreenWidth(13),
          ),
        ),
      ],
    );
  }
}
