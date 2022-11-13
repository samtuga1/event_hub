import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart';
import 'package:meta/meta.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  late Location location = Location();

  LocationCubit() : super(LocationLoading());

  getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    try {
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }
      emit(LocationLoading());
      _locationData = await location.getLocation();
      List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
        _locationData.latitude!,
        _locationData.longitude!,
      );
      emit(
        LocationInfo(
          _locationData.latitude,
          _locationData.longitude,
          placemarks,
        ),
      );
    } catch (err) {
      print(err);
    }
  }
}
