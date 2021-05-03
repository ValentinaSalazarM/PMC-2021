import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:noboto_app/src/business_logic/models/models.dart';
import 'package:noboto_app/src/views/utils/constants.dart';

class PostCreate extends StatefulWidget {
  @override
  _PostCreateState createState() => _PostCreateState();
}

class _PostCreateState extends State<PostCreate> {
  final _firstFormKey = GlobalKey<FormState>();
  final _secondFormKey = GlobalKey<FormState>();

  String _category = "";
  String _name = "";
  String _description = "";
  int _condition = 0;
  List<String> _imageUrls = [];
  String _want = "";
  String _wantDescription = "";

  List<String> categories = [
    "Libros",
    "Juguetes",
    "Decoración",
    "Cocina",
    "Música",
    "Arte"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: Text("Publicar Trueque"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text("Publica una oferta de trueque"),
            ),
            preferredSize: Size.fromHeight(15),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _firstStep(),
              _secondStep(),
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
                      onPressed: () {
                        if (_firstFormKey.currentState!.validate() &&
                            _secondFormKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Oferta publicada con éxito')));
                          Navigator.of(context).pop();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Por favor revisa los campos.')));
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Publicar"),
                      )),
                )),
              )
            ],
          ),
        ));
  }

  Widget _firstStep() {
    return Form(
      key: _firstFormKey,
      child: Card(
        margin: EdgeInsets.all(15),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "1. ¿Qué quieres ofrecer?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  decoration: _inputDecoration("Categoria"),
                  items: categories
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (_) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: _inputDecoration("Nombre del objeto"),
                    onChanged: (_) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese un nombre';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: _inputDecoration(
                        "Agrega una descripción o información adicional \nEj. Referencia, edad, uso\n"),
                    maxLines: 3,
                    onChanged: (_) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese un nombre';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: _imageList(),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Indica la condición del artículo"),
              ),
              Padding(padding: const EdgeInsets.all(8.0), child: _conditions())
            ],
          ),
        ),
      ),
    );
  }

  Widget _secondStep() {
    return Form(
      key: _secondFormKey,
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "2. ¿Qué te gustaría recibir?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: _inputDecoration("Nombre del objeto"),
                    onChanged: (value) {
                      _want = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese un nombre';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: _inputDecoration(
                        "Agrega una descripción o información adicional"),
                    maxLines: 3,
                    onChanged: (value) {
                      _wantDescription = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese un nombre';
                      }
                      return null;
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _imageList() {
    List<Widget> cardList = [];
    if (_imageUrls.isEmpty) {
      cardList.add(Container(
        width: 150,
        height: 100,
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Icon(
                Icons.sentiment_dissatisfied,
                size: 50,
                color: kSecondaryColor,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "No has subido ninguna imágen. Sube al menos una imágen del artículo.",
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ));
    }
    cardList.add(Container(
      width: 150,
      child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            icon: Icon(
              Icons.add,
              size: 50,
              color: kSecondaryColor,
            ),
            onPressed: () {},
          )),
    ));
    return cardList;
  }

  Widget _conditions() {
    List<String> conditionsText = ["Muy usado", "Usado", "Como nuevo"];
    List<Widget> conditions = [];
    conditionsText.asMap().forEach((index, value) {
      List<Widget> stackList = [];
      Widget icon = IconButton(
        icon: Icon(Icons.check_circle, color: getConditionColor(index)),
        onPressed: () {
          setState(() {
            _condition = index + 1;
          });
        },
      );
      stackList.add(icon);
      if (_condition == index + 1) {
        Widget check = Icon(
          Icons.check,
          size: 50,
        );
        stackList.add(check);
      }
      Widget stack = Stack(
        alignment: AlignmentDirectional.center,
        children: stackList,
      );
      conditions.add(Column(
        children: [stack, Text(conditionsText[index])],
      ));
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: conditions,
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      fillColor: kSecondaryColor.withOpacity(0.1),
      filled: true,
    );
  }
}
