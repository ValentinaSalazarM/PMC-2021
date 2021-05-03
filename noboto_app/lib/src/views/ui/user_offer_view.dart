import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:noboto_app/src/business_logic/models/models.dart';
import 'package:noboto_app/src/views/utils/components/buttons.dart';
import 'package:noboto_app/src/views/utils/constants.dart';
import 'package:noboto_app/src/views/utils/size_config.dart';
import 'package:timeline_tile/timeline_tile.dart';

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

class ExchangeProgress extends StatelessWidget {
  const ExchangeProgress({
    Key? key,
    this.width = 320,
    this.height = 30,
  }) : super(key: key);
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxHeight: 45, maxWidth: 330),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.end,
              isFirst: true,
              indicatorStyle: IndicatorStyle(
                height: 10,
                color: Color(0xFF1F3A83),
                padding: const EdgeInsets.all(5),
              ),
              startChild: ExchangeProgressText(text: "Publicado"),
            ),
            TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.end,
              indicatorStyle: IndicatorStyle(
                height: 10,
                color: Color(0xFF1F3A83),
                padding: const EdgeInsets.all(5),
              ),
              startChild: ExchangeProgressText(text: "Contraoferta aceptada"),
            ),
            TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.end,
              indicatorStyle: IndicatorStyle(
                height: 10,
                color: Color(0xFF1F3A83),
                padding: const EdgeInsets.all(5),
              ),
              startChild: ExchangeProgressText(text: "Esperando confirmación"),
            ),
            TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.end,
              indicatorStyle: IndicatorStyle(
                height: 10,
                color: Color(0xFF1F3A83),
                padding: const EdgeInsets.all(5),
              ),
              startChild: ExchangeProgressText(text: "En progreso"),
            ),
            TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.end,
              isLast: true,
              indicatorStyle: IndicatorStyle(
                height: 10,
                color: Color(0xFF1F3A83),
                padding: const EdgeInsets.all(5),
              ),
              startChild: ExchangeProgressText(text: "Finalizado"),
            ),
          ],
        ),
      ),
    );
  }
}

class ExchangeProgressText extends StatelessWidget {
  const ExchangeProgressText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60,
        height: 20,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 9),
            textAlign: TextAlign.center,
          ),
        ));
  }
}

class CounterofferCard extends StatelessWidget {
  const CounterofferCard({
    Key? key,
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.counteroffer,
  }) : super(key: key);

  final double width, aspectRatio;
  final Counteroffer counteroffer;

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
                              text: "Aceptar contraoferta", press: () {}),
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
          "${text}",
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

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

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
          GestureDetector(
            onTap: press,
            child: Text(
              "Ver más",
              style: TextStyle(color: Color(0xFFBBBBBB)),
            ),
          ),
        ],
      ),
    );
  }
}
