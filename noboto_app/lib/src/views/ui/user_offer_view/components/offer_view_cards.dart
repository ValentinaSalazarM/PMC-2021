import 'package:flutter/material.dart';
import 'package:noboto_app/src/business_logic/models/models.dart';
import 'package:noboto_app/src/views/ui/user_offer_view/components/profile_picture.dart';
import 'package:noboto_app/src/views/ui/user_offer_view/trade_two_view.dart';
import 'package:noboto_app/src/views/utils/components/buttons.dart';
import 'package:noboto_app/src/views/utils/components/indicators.dart';
import 'package:noboto_app/src/views/utils/constants.dart';
import 'package:noboto_app/src/views/utils/size_config.dart';

class CounterofferCard extends StatelessWidget {
  const CounterofferCard({
    Key? key,
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.counteroffer,
    required this.post,
  }) : super(key: key);

  final double width, aspectRatio;
  final Counteroffer counteroffer;
  final Post post;

  @override
  Widget build(BuildContext context) {
    final bool expanded = (width > 250 && aspectRatio < 1);
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: expanded
            ? Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: AspectRatio(
                  aspectRatio: aspectRatio,
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(20)),
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
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ProfilePic(
                                height: (width - 20) / 5,
                                width: (width - 20) / 5,
                                asset: counteroffer.user!.profilePictureUrl ??
                                    "assets/images/default_user.png",
                              ),
                              CounterofferInfo(counteroffer: counteroffer),
                              SizedBox(
                                height: (width - 20) / 5,
                                width: (width - 20) / 5,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  child: Image.asset(
                                    "assets/images/map_mock.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ColoredIndicator(
                                asset: "assets/icons/fairness.svg",
                                color: getFairnessColor(
                                        counteroffer.fairIndex ?? 0) ??
                                    Colors.grey,
                                text: getFairnessText(
                                    counteroffer.fairIndex ?? 0),
                              ),
                              ColoredIndicator(
                                asset: "assets/icons/condition.svg",
                                color: getConditionColor(
                                        counteroffer.product!.condition ?? 0) ??
                                    Colors.grey,
                                text: getConditionText(
                                    counteroffer.product!.condition ?? 0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: width / aspectRatio * 0.4,
                            width: (width - 20),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              child: Image.asset(
                                  counteroffer.product!.imageUrls![0]),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            counteroffer.message ?? "",
                            style: TextStyle(color: Colors.black54),
                          ),
                          const SizedBox(height: 5),
                          BlueButtonWidget(
                            text: "Aceptar contraoferta",
                            press: () {
                              Exchange exchange = Exchange(
                                active: true,
                                step: 'ACEPTADA',
                                offer: post,
                                counteroffer: counteroffer,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TradeS2View(exchange: exchange)),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Column(
                children: [
                  AspectRatio(
                    aspectRatio: aspectRatio,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
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
                      child: Image.asset(counteroffer.product!.imageUrls![0]),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    counteroffer.product!.name ?? "",
                    style: TextStyle(color: Colors.black),
                  ),
                  // Text(
                  //   "\$${product.price}",
                  //   style: TextStyle(
                  //       fontSize: getProportionateScreenWidth(18),
                  //       color: kPrimaryColor),
                  // )
                ],
              ),
      ),
    );
  }
}

class RecommendedCard extends StatelessWidget {
  const RecommendedCard({
    Key? key,
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.post,
  }) : super(key: key);

  final double width, aspectRatio;
  final Post post;

  @override
  Widget build(BuildContext context) {
    final bool expanded = (width > 250 && aspectRatio < 1);
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: expanded
            ? Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: AspectRatio(
                  aspectRatio: aspectRatio,
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(20)),
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
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ProfilePic(
                                height: (width - 20) / 5,
                                width: (width - 20) / 5,
                                asset: post.user!.profilePictureUrl ??
                                    "assets/images/default_user.png",
                              ),
                              PostInfo(post: post),
                              SizedBox(
                                height: (width - 20) / 5,
                                width: (width - 20) / 5,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  child: Image.asset(
                                    "assets/images/map_mock.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ColoredIndicator(
                                asset: "assets/icons/fairness.svg",
                                color: getFairnessColor(post.fairIndex ?? 0) ??
                                    Colors.grey,
                                text: getFairnessText(post.fairIndex ?? 0),
                              ),
                              ColoredIndicator(
                                asset: "assets/icons/condition.svg",
                                color: getConditionColor(
                                        post.product.condition ?? 0) ??
                                    Colors.grey,
                                text: getConditionText(
                                    post.product.condition ?? 0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: width / aspectRatio * 0.4,
                            width: (width - 20),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              child: Image.asset(post.product.imageUrls![0]),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            post.product.description ?? "",
                            style: TextStyle(color: Colors.black54),
                          ),
                          const SizedBox(height: 5),
                          BlueButtonWidget(
                            text: "Envía una contraoferta",
                            press: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Column(
                children: [
                  AspectRatio(
                    aspectRatio: aspectRatio,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
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
                      child: Image.asset(post.product.imageUrls![0]),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    post.product.name ?? "",
                    style: TextStyle(color: Colors.black),
                  ),
                  // Text(
                  //   "\$${product.price}",
                  //   style: TextStyle(
                  //       fontSize: getProportionateScreenWidth(18),
                  //       color: kPrimaryColor),
                  // )
                ],
              ),
      ),
    );
  }
}

class CounterofferInfo extends StatelessWidget {
  const CounterofferInfo({
    Key? key,
    required this.counteroffer,
  }) : super(key: key);

  final Counteroffer counteroffer;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              counteroffer.user!.name ?? "Anonymous",
              style: TextStyle(
                color: Colors.black54,
                fontFamily: "Metropolis",
                fontSize: getProportionateScreenWidth(17),
              ),
            ),
            Row(
              children: [
                BlueIconIndicator(
                  text: "${counteroffer.user!.rating ?? 4.5}",
                  icon: Icons.star_rounded,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(8),
                  ),
                  child: Icon(
                    Icons.circle,
                    color: Color(0xFF1F3A83),
                    size: getProportionateScreenWidth(5),
                  ),
                ),
                BlueIconIndicator(
                  text: "${counteroffer.distance ?? 0.3} km",
                  icon: Icons.location_on,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PostInfo extends StatelessWidget {
  const PostInfo({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.user!.name ?? "Anonymous",
              style: TextStyle(
                color: Colors.black54,
                fontFamily: "Metropolis",
                fontSize: getProportionateScreenWidth(17),
              ),
            ),
            Row(
              children: [
                BlueIconIndicator(
                  text: "${post.user!.rating ?? 4.5}",
                  icon: Icons.star_rounded,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(8),
                  ),
                  child: Icon(
                    Icons.circle,
                    color: Color(0xFF1F3A83),
                    size: getProportionateScreenWidth(5),
                  ),
                ),
                BlueIconIndicator(
                  text: "${post.distance ?? 0.3} km",
                  icon: Icons.location_on,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
