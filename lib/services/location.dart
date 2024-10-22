import 'package:geolocator/geolocator.dart';
class Location {

  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
    }
    catch(e){
      print(e);
    }

    // Check if permission is granted
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('Location permissions are permanently denied.');
      return;
    }

    // If permissions are granted, get the location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low   ,


    );
    latitude =position.latitude;
    longitude=position.longitude;

  }
}