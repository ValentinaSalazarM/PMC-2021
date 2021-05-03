import 'package:flutter/material.dart';

import 'package:noboto_app/src/business_logic/models/models.dart';
import 'package:noboto_app/src/views/ui/user_offer_view/components/offer_product_card.dart';
import 'package:noboto_app/src/views/ui/user_offer_view/components/offer_view_cards.dart';
import 'package:noboto_app/src/views/ui/user_offer_view/components/section_title.dart';
import 'package:noboto_app/src/views/utils/size_config.dart';

class UserOfferView extends StatefulWidget {
  final Post post;

  const UserOfferView({Key? key, required this.post}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _UserOfferView();
}

class _UserOfferView extends State<UserOfferView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10,
        toolbarHeight: getProportionateScreenHeight(90),
        title: Text("${widget.post.title}"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          tooltip: 'Atrás',
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Body(post: widget.post),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool expandedCounteroffer = false;
  bool expandedRecommended = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(30)),
            MainProductCard(post: widget.post),
            SizedBox(height: getProportionateScreenWidth(30)),
            Column(
              children: [
                SectionTitle(
                  title: "Contraofertas",
                  press: () {
                    setState(() {
                      expandedCounteroffer = !expandedCounteroffer;
                    });
                  },
                ),
                SizedBox(height: getProportionateScreenWidth(15)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        widget.post.counteroffers!.length,
                        (index) => CounterofferCard(
                          counteroffer: widget.post.counteroffers![index],
                          width: expandedCounteroffer ? 340 : 140,
                          aspectRatio: expandedCounteroffer ? 0.8 : 1.02,
                        ),
                      ),
                      SizedBox(width: getProportionateScreenWidth(20)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            Column(
              children: [
                SectionTitle(
                  title: "Recomendaciones",
                  press: () {
                    setState(() {
                      expandedRecommended = !expandedRecommended;
                    });
                  },
                ),
                SizedBox(height: getProportionateScreenWidth(15)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        widget.post.recommended!.length,
                        (index) => RecommendedCard(
                          post: widget.post.recommended![index],
                          width: expandedRecommended ? 350 : 140,
                          aspectRatio: expandedRecommended ? 0.7 : 1.02,
                        ),
                      ),
                      SizedBox(width: getProportionateScreenWidth(20)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
