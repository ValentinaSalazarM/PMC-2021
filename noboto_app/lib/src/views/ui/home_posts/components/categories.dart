import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {"icon": "assets/icons/open-book.png", "name": "Libros"},
    {"icon": "assets/icons/toys.png", "name": "Juguetes"},
    {"icon": "assets/icons/decor.png", "name": "Decoración"},
    {"icon": "assets/icons/cooking-tools.png", "name": "Cocina"},
    {"icon": "assets/icons/guitar.png", "name": "Música"},
    {"icon": "assets/icons/brush.png", "name": "Arte"},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 125,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => CategoryCard(
              categories[index]["icon"], categories[index]["name"]),
          itemCount: categories.length,
        ));
  }
}

class CategoryCard extends StatefulWidget {
  final String icon;
  final String name;
  CategoryCard(this.icon, this.name);
  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                check = !check;
              });
            },
            child:
                Stack(alignment: AlignmentDirectional.center, children: icon()),
          ),
          Text(widget.name)
        ],
      ),
    );
  }

  List<Widget> icon() {
    List<Widget> iconStack = [Image.asset(widget.icon, height: 75)];
    if (check) {
      iconStack.add(Icon(
        Icons.check,
        size: 50,
      ));
    }

    return iconStack;
  }
}
