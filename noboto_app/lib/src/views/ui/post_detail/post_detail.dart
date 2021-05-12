import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:noboto_app/src/business_logic/models/models.dart';
import 'package:noboto_app/src/views/utils/constants.dart';
import 'dart:math' as math; // import this
import 'package:noboto_app/src/views/ui/maps.dart';

class PostDetail extends StatelessWidget {
  final Post post;
  PostDetail(this.post);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(alignment: Alignment.bottomCenter, children: [
                CachedNetworkImage(
                    imageUrl: post.product.imageUrls![0],
                    imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider,
                                  alignment: FractionalOffset.topCenter,
                                  fit: BoxFit.cover)),
                        ),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error)),
                Container(
                    height: 0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                      ),
                    ))
              ]),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [_basicInfo(), _publisherInfo()],
                ),
                _description(),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Divider(
                      color: kSecondaryColor,
                    ),
                    Transform.rotate(
                      angle: 90 * math.pi / 180,
                      child: Icon(Icons.sync_alt, size: 50),
                    )
                  ],
                ),
                _wantDescription(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: SizedBox(
                          width: 348, height: 200, child: GoogleMapScreen())),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(31, 58, 131, 1),
                          textStyle: TextStyle(
                            fontSize: 18,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Contraofertar"),
                        )),
                  )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _basicInfo() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              width: 225,
              child: Text(
                post.product.name!,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: [Icon(Icons.check), Text("Estado")],
          ),
          Row(
            children: [Icon(Icons.place), Text("500 m")],
          )
        ],
      ),
    );
  }

  Widget _publisherInfo() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CachedNetworkImage(
              imageUrl: post.user!.profilePictureUrl!,
              imageBuilder: (context, imageProvider) => Container(
                    width: 75.0,
                    height: 75.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error)),
          Center(
            child: Text(post.user!.name!),
          ),
          Center(
              child: RatingBarIndicator(
            rating: post.user!.rating!.toDouble(),
            itemBuilder: (context, index) => Icon(
              Icons.star,
            ),
            itemCount: 5,
            itemSize: 20.0,
            direction: Axis.horizontal,
          ))
        ],
      ),
    );
  }

  Widget _description() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              "Descripción",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Text(post.product.description!)
        ],
      ),
    );
  }

  Widget _wantDescription() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              post.want!=null?post.want!:"",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Text(post.wantDescription!=null?post.wantDescription!:"")
        ],
      ),
    );
  }
}
