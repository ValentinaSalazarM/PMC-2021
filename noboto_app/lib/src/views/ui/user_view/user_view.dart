import 'package:flutter/material.dart';
import 'package:noboto_app/src/business_logic/models/models.dart';
import 'package:noboto_app/src/views/ui/user_offer_view/user_offer_view.dart';
import 'package:noboto_app/src/views/utils/constants.dart';
import 'package:noboto_app/src/views/utils/size_config.dart';

class UserView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserView();
}

class _UserView extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getProportionateScreenHeight(90),
        title: Text("Perfil"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          tooltip: 'Atrás',
          onPressed: () => Navigator.of(context).pop(),
        ),
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
    final user = userDemo;
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
                  "¡Hola ${user.name}!",
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
                  '(${user.rating})',
                  style: TextStyle(color: Color(0xFF1F3A83)),
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            Column(
              children: [
                SectionTitleUser(text: "Mis ofertas"),
                SizedBox(height: getProportionateScreenWidth(15)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        user.posts!.length,
                        (index) => ProductCard(
                          post: user.posts![index],
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
                SectionTitleUser(text: "Mis contraofertas"),
                SizedBox(height: getProportionateScreenWidth(15)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        user.counteroffers!.length,
                        (index) => CounterofferCard(
                          counteroffer: user.counteroffers![index],
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
    required this.post,
  }) : super(key: key);

  final double width, aspectRatio;
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserOfferView(post: post)),
            );
          },
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
                    child: Image.asset(post.product.imageUrls![0]),
                  )),
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
      ),
    );
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
                  child: Image.asset(counteroffer.product!.imageUrls![0]),
                )),
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

class SectionTitleUser extends StatelessWidget {
  const SectionTitleUser({
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
      ),
    );
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
