import 'package:flutter/material.dart';
import 'package:noboto_app/src/business_logic/models/models.dart';
import 'package:noboto_app/src/views/utils/constants.dart';
import 'package:noboto_app/src/views/utils/size_config.dart';

class UserView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserView();
}

class _UserView extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getProportionateScreenHeight(90),
        title: Text("Perfil"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Log Out',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Log out is not yet implemented')));
            },
          ),
        ],
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  final rating = 3.5;
  final name = 'Camila';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfilePic(),
            SizedBox(height: getProportionateScreenWidth(15)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "¡Hola ${name}!",
                  style: TextStyle(
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w700,
                    fontSize: getProportionateScreenWidth(16),
                    color: Color(0xFF4A4B4D),
                  ),
                ),
                StarRating(
                  rating: rating,
                  color: Color(0xFF1F3A83),
                ),
                Text(
                  '(${rating})',
                  style: TextStyle(color: Color(0xFF1F3A83)),
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            Column(
              children: [
                SectionTitle(text: "Mis ofertas"),
                SizedBox(height: getProportionateScreenWidth(15)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        demoProducts.length,
                        (index) => ProductCard(
                          product: demoProducts[index],
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
                SectionTitle(text: "Mis contraofertas"),
                SizedBox(height: getProportionateScreenWidth(15)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        demoProducts.length,
                        (index) => ProductCard(
                          product: demoProducts[index],
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

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRatio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: Column(
          children: [
            AspectRatio(
                aspectRatio: aspectRatio,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(product.imageUrls![0]),
                )),
            const SizedBox(height: 5),
            Text(
              product.name ?? "",
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

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.text,
    // required this.press,
  }) : super(key: key);
  final String text;
  // final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          Text(text,
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.black)),
        ],
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFFF5F6F9))),
        onPressed: () {},
        child: Row(
          children: [],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 115,
        width: 115,
        child: CircleAvatar(
          backgroundImage:
              AssetImage("assets/images/example_user_profile_pic.jpg"),
        ));
  }
}

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback? onRatingChanged;
  final Color? color;

  StarRating(
      {this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border_rounded,
        color: color ?? Theme.of(context).primaryColor,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half_rounded,
        color: color ?? Theme.of(context).primaryColor,
      );
    } else {
      icon = new Icon(
        Icons.star_rounded,
        color: color ?? Theme.of(context).primaryColor,
      );
    }
    return new InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(starCount, (index) => buildStar(context, index)),
    );
  }
}
