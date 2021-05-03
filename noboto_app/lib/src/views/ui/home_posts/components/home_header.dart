import 'package:flutter/material.dart';
import 'package:noboto_app/src/views/utils/constants.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(50),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                fillColor: kSecondaryColor.withOpacity(0.1),
                filled: true,
                hintText: "Buscar",
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.all(0),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(), primary: Colors.white, elevation: 5),
                child: Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Icon(
                      Icons.filter_list,
                      color: kSecondaryColor,
                    )),
                onPressed: () {},
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    primary: Colors.white,
                    elevation: 5),
                child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Icon(
                          Icons.place,
                          color: kSecondaryColor,
                        ),
                        Text("Casa", style: TextStyle(color: kSecondaryColor))
                      ],
                    )),
                onPressed: () {},
              )
            ],
          ),
        )
      ],
    );
  }
}
