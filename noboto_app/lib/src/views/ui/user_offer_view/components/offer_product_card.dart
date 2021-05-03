import 'package:flutter/material.dart';
import 'package:noboto_app/src/business_logic/models/models.dart';
import 'package:noboto_app/src/views/ui/user_offer_view/components/profile_picture.dart';
import 'package:noboto_app/src/views/ui/user_offer_view/components/progress_timeline.dart';
import 'package:noboto_app/src/views/utils/size_config.dart';

class MainProductCard extends StatelessWidget {
  const MainProductCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(15),
        vertical: getProportionateScreenHeight(15),
      ),
      width: double.infinity,
      height: getProportionateScreenHeight(200),
      decoration: BoxDecoration(
        color: Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ExchangeProgress(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProfilePic(
                asset: post.product.imageUrls![0],
                height: 95,
                width: 95,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Text.rich(
                      TextSpan(
                        text: 'Publicaste hace ', // default text style
                        children: <TextSpan>[
                          TextSpan(
                            text: '${3}',
                            style: TextStyle(
                              color: Color(0xFF1F3A83),
                            ),
                          ),
                          TextSpan(
                            text: ' días',
                          ),
                        ],
                      ),
                      style: TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: getProportionateScreenWidth(14),
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF7C7D7E),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Text.rich(
                      TextSpan(
                        text: 'Tu publicación tiene  ', // default text style
                        children: <TextSpan>[
                          TextSpan(
                            text: '${15}',
                            style: TextStyle(
                              color: Color(0xFF1F3A83),
                            ),
                          ),
                          TextSpan(
                            text: ' vistas',
                          ),
                        ],
                      ),
                      style: TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: getProportionateScreenWidth(14),
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF7C7D7E),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Text.rich(
                      TextSpan(
                        text: 'Tienes ', // default text style
                        children: <TextSpan>[
                          TextSpan(
                            text: '${post.counteroffers!.length}',
                            style: TextStyle(
                              color: Color(0xFF1F3A83),
                            ),
                          ),
                          TextSpan(
                            text: ' contraofertas',
                          ),
                        ],
                      ),
                      style: TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: getProportionateScreenWidth(14),
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF7C7D7E),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Text(
            "Acepta una contraoferta para continuar",
            style: TextStyle(
              fontFamily: 'Metropolis',
              color: Color(0xFF4A4B4D),
              fontSize: getProportionateScreenWidth(14),
            ),
          ),
        ],
      ),
    );
  }
}
