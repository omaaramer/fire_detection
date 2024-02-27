import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../helper/location_helper.dart';

class Map2Screen extends StatefulWidget {
  const Map2Screen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<Map2Screen> {
  static Position? position;
  final Completer<GoogleMapController> _mapController = Completer();

  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );

  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation().whenComplete(() {
      setState(() {});
    });
  }

  @override
  initState() {
    super.initState();
    getMyCurrentLocation();
  }

  Widget buildMap() {
    return GoogleMap(
      mapType: MapType.normal, //MapType.satellite,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      initialCameraPosition: _myCurrentLocationCameraPosition,
      onMapCreated: (GoogleMapController controller) {
        _mapController.complete(controller);
      },
    );
  }

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          position != null
              ? buildMap()
              : Center(
                  child: Container(
                    child: const CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
                )
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 8, 30),
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: _goToMyCurrentLocation,
          child: const Icon(Icons.place, color: Colors.white),
        ),
      ),
    );
  }
}
