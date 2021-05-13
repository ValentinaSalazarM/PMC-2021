import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapAddAddress extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<MapAddAddress> {
  Set<Marker> _markers = {};
  String searchAddr = '';
  GoogleMapController? mapController;
  LatLng actual = LatLng(4.602995, -74.065303);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('id-1'),
          position: actual,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cambiar dirección"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            tooltip: 'Atrás',
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Stack(children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            markers: Set.from(_markers),
            initialCameraPosition: CameraPosition(target: actual, zoom: 15),
          ),
          Positioned(
            top: 30.0,
            right: 15.0,
            left: 15,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Ingrese su dirección',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15, top: 15),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: searchandNavigate,
                      iconSize: 30,
                    )),
                onChanged: (val) {
                  setState(() {
                    searchAddr = val;
                  });
                },
              ),
            ),
          )
        ]),
        bottomNavigationBar: Stack(
          children: [
            Padding(
                padding: const EdgeInsets.all(15.0),
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
                      onPressed: () => Navigator.of(context).pop(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Guardar"),
                      )),
                )),
          ],
        ));
  }

  searchandNavigate() {
    locationFromAddress(searchAddr).then((result) {
      actual = LatLng(result[0].latitude, result[0].longitude);
      setState(() {
        _markers = {};
        _markers.add(
          Marker(
            markerId: MarkerId(actual.toString()),
            position: actual,
          ),
        );
      });

      mapController?.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: actual, zoom: 15.0)));
    });
  }
}
