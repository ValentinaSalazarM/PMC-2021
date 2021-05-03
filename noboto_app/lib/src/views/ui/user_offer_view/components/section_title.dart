import 'package:flutter/material.dart';
import 'package:noboto_app/src/views/utils/size_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
    this.seeMore = true,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;
  final bool seeMore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(20),
        right: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: Colors.black,
              fontFamily: 'Metropolis',
              fontWeight: FontWeight.w800,
            ),
          ),
          seeMore
              ? GestureDetector(
                  onTap: press,
                  child: Text(
                    "Ver más",
                    style: TextStyle(color: Color(0xFFBBBBBB)),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
