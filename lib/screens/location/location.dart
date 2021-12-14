import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/constants/app_image.dart';
import 'package:flutter_demo/screens/custom_appbar/common_appbar.dart';
import 'package:geolocator/geolocator.dart';

class MyLocation extends StatefulWidget {
  const MyLocation({Key? key}) : super(key: key);

  @override
  _MyLocationState createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> with AppBase {
  String location = 'Press Button';
  String address = 'search';

  @override
  Widget build(BuildContext context) => buildAppBar();

  Widget buildAppBar() => Scaffold(
        backgroundColor: Colors.white,
        appBar: const CommonAppBar(
          icon: AppImages.icCustomBack,
          title: 'Current Location (GPS)',
        ),
        body: buildlocationScreen(),
      );

  Widget buildlocationScreen() => GestureDetector(
        onTap: () => hideKeyBoard(),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildText('Coordinates Points',
                      fontWeight: FontWeight.bold, color: Colors.grey),
                  buildText(location, size: 16.0, color: Colors.black),
                  buildText('Address',
                      fontWeight: FontWeight.bold, color: Colors.grey),
                  buildText(address, size: 16.0, color: Colors.black),
                  ElevatedButton(
                      onPressed: () => getGPSLoaction(),
                      child: const Text('Get Location'))
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildText(
    String text, {
    double size = 22.0,
    color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
  }) =>
      Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Text(
          text,
          style:
              TextStyle(fontSize: size, color: color, fontWeight: fontWeight),
        ),
      );

  getGPSLoaction() async {
    Position position = await getGeoLocationPosition();
    location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
    // GetAddressFromLatLong(position);
  }

  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}
