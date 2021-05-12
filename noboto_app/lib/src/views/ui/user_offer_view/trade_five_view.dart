import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noboto_app/src/business_logic/models/models.dart';
import 'package:noboto_app/src/views/ui/user_offer_view/components/offer_product_card.dart';
import 'package:noboto_app/src/views/ui/user_offer_view/components/section_title.dart';
import 'package:noboto_app/src/views/ui/user_view/user_view.dart';
import 'package:noboto_app/src/views/utils/components/buttons.dart';
import 'package:noboto_app/src/views/utils/size_config.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TradeS5View extends StatefulWidget {
  final Exchange exchange;

  const TradeS5View({Key? key, required this.exchange}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _UserOfferView();
}

class _UserOfferView extends State<TradeS5View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10,
        toolbarHeight: getProportionateScreenHeight(90),
        title: Text("${widget.exchange.offer!.title}"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          tooltip: 'Atrás',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserView()),
          ),
        ),
      ),
      body: Body(exchange: widget.exchange),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.exchange,
  }) : super(key: key);
  final Exchange exchange;

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
            SizedBox(height: getProportionateScreenHeight(5)),
            MainTradeCard(
              exchange: widget.exchange,
              state: widget.exchange.getStateNumber(),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            SectionTitle(
              title: "Detalle de tu intercambio",
              seeMore: false,
              press: () {},
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            _ratingBar(),
            SizedBox(height: getProportionateScreenHeight(20)),
            BlueButtonWidget(
              text: "Quiero otro intercambio",
              press: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserView()),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            WhiteButtonWidget(
              text: "Quiero reportar un inconveniente",
              press: () {},
            ),
            SizedBox(height: getProportionateScreenWidth(10)),
          ],
        ),
      ),
    );
  }
}

class ExchangeDateCard extends StatelessWidget {
  const ExchangeDateCard({
    Key? key,
    this.enabled = true,
  }) : super(key: key);
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(15),
        vertical: getProportionateScreenHeight(10),
      ),
      width: double.infinity,
      height: getProportionateScreenHeight(130),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: AssetImage('assets/images/schedule.png'),
              height: getProportionateScreenHeight(130),
              width: getProportionateScreenHeight(130),
              fit: BoxFit.fitHeight,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    "Horario",
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: getProportionateScreenWidth(150),
                        child: TextField(
                          decoration: InputDecoration(
                            border:
                                UnderlineInputBorder(), // NO ENTIENDO POR QUÉ NO FUNCIONA
                          ),
                        ),
                      ),
                    ),
                    Icon(CupertinoIcons.chevron_right)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExchangeLocationCard extends StatelessWidget {
  const ExchangeLocationCard({
    Key? key,
    this.enabled = true,
  }) : super(key: key);
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(15),
        vertical: getProportionateScreenHeight(10),
      ),
      width: double.infinity,
      height: getProportionateScreenHeight(130),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: AssetImage('assets/images/map_mock.png'),
              height: getProportionateScreenHeight(130),
              width: getProportionateScreenHeight(130),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    "Punto de encuentro",
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: getProportionateScreenWidth(150),
                        child: TextField(
                          decoration: InputDecoration(
                            border:
                                UnderlineInputBorder(), // NO ENTIENDO POR QUÉ NO FUNCIONA
                          ),
                        ),
                      ),
                    ),
                    Icon(CupertinoIcons.chevron_right)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _ratingBar() {
  return RatingBar.builder(
    initialRating: 3,
    minRating: 1,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
    itemBuilder: (context, _) => Icon(
      Icons.star,
      color: Colors.amber,
    ),
    onRatingUpdate: (rating) {
      print(rating);
    },
  );
}
