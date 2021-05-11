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
      height: getProportionateScreenHeight(210),
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
          ExchangeProgress(state: 0),
          SizedBox(height: getProportionateScreenWidth(8)),
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
                children: buildProductCardText(post),
              )
            ],
          ),
          SizedBox(height: getProportionateScreenWidth(8)),
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

class MainTradeCard extends StatelessWidget {
  const MainTradeCard({
    Key? key,
    required this.exchange,
    this.state = 0,
  }) : super(key: key);

  final int state;
  final Exchange exchange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(15),
        vertical: getProportionateScreenHeight(15),
      ),
      width: double.infinity,
      height: getProportionateScreenHeight(state == 4 ? 200 : 270),
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
          ExchangeProgress(state: state),
          SizedBox(height: getProportionateScreenWidth(8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DoubleProfilePic(
                firstAsset: exchange.offer!.product.imageUrls![0],
                secondAsset: exchange.counteroffer!.product!.imageUrls![0],
                height: 95,
                width: 95,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: buildTradeCardText(exchange, state),
              )
            ],
          ),
          SizedBox(height: getProportionateScreenWidth(13)),
          Expanded(
            child: Text(
              getFooterText(state),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Metropolis',
                color: Color(0xFF4A4B4D),
                fontSize: getProportionateScreenWidth(14),
              ),
            ),
          ),
          state == 4
              ? SizedBox(height: getProportionateScreenWidth(3))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        "Recuerda que puedes\ncomunicarte con tu vecino",
                        style: TextStyle(
                          fontFamily: 'Metropolis',
                          fontSize: 12,
                          color: Color(0xFF1F3A83),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child:
                          Icon(Icons.message_rounded, color: Color(0xFF1F3A83)),
                    )
                  ],
                ),
        ],
      ),
    );
  }

  String getFooterText(int state) {
    switch (state) {
      case 1:
        return "Escoge un punto de encuentro\ny horario para continuar";
      case 2:
        return "Espera la confirmación\nde tu vecino";
      case 3:
        return "Dirígete al punto de encuentro\ncuando sea hora del intercambio";
      case 4:
        return "Este intercambio ha finalizado";
      default:
        return "Acepta una contraoferta para continuar";
    }
  }
}

List<Widget> buildProductCardText(Post post) {
  return [
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
  ];
}

List<Widget> buildTradeCardText(Exchange exchange, int state) {
  switch (state) {
    case 1:
      return [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2),
          child: Text(
            '¡Felicitaciones!\nHas aceptado \nuna contraoferta.', // default text style
            style: TextStyle(
              fontFamily: 'Metropolis',
              fontSize: getProportionateScreenWidth(14),
              fontWeight: FontWeight.w500,
              color: Color(0xFF7C7D7E),
            ),
          ),
        ),
      ];
    case 2:
      return [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2),
          child: Text.rich(
            TextSpan(
              text: '¡Pronto podrás disfrutar tu ', // default text style
              children: <TextSpan>[
                TextSpan(
                  text: '${exchange.counteroffer!.product!.name}',
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
      ];
    case 3:
      return [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2),
          child: Text.rich(
            TextSpan(
              text:
                  '¡A un solo paso de efectuar tu intercambio!', // default text style
            ),
            style: TextStyle(
              fontFamily: 'Metropolis',
              fontSize: getProportionateScreenWidth(14),
              fontWeight: FontWeight.w500,
              color: Color(0xFF7C7D7E),
            ),
          ),
        ),
      ];
    case 4:
      return [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2),
          child: Text.rich(
            TextSpan(
              text:
                  '¡Felicidades, has efectuado un intercambio!', // default text style
            ),
            style: TextStyle(
              fontFamily: 'Metropolis',
              fontSize: getProportionateScreenWidth(14),
              fontWeight: FontWeight.w500,
              color: Color(0xFF7C7D7E),
            ),
          ),
        ),
      ];
    default:
      return buildProductCardText(exchange.offer!);
  }
}
