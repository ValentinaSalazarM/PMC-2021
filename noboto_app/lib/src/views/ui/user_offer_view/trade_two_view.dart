import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noboto_app/src/business_logic/models/models.dart';
import 'package:noboto_app/src/views/ui/user_offer_view/components/offer_product_card.dart';
import 'package:noboto_app/src/views/ui/user_offer_view/components/section_title.dart';
import 'package:noboto_app/src/views/ui/user_view/user_view.dart';
import 'package:noboto_app/src/views/utils/components/buttons.dart';
import 'package:noboto_app/src/views/utils/size_config.dart';

class TradeS2View extends StatefulWidget {
  final Exchange exchange;

  const TradeS2View({Key? key, required this.exchange}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _UserOfferView();
}

class _UserOfferView extends State<TradeS2View> {
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
            SizedBox(height: getProportionateScreenWidth(5)),
            MainTradeCard(
              exchange: widget.exchange,
              state: widget.exchange.getStateNumber(),
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            SectionTitle(
              title: "Detalle de tu intercambio",
              seeMore: false,
              press: () {},
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
            ExchangeLocationCard(),
            SizedBox(height: getProportionateScreenWidth(20)),
            ExchangeDateCard(),
            SizedBox(height: getProportionateScreenWidth(20)),
            BlueButtonWidget(
              text: "Enviar detalles",
              press: () {
                widget.exchange.step = 'ESPERA_CONFIRMACION';
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => TradeS3View(exchange: exchange)),
                // );
              },
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
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
        vertical: getProportionateScreenHeight(15),
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
        vertical: getProportionateScreenHeight(15),
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
