part of 'location_cubit.dart';

@immutable
abstract class LocationState {}

class LocationLoading extends LocationState {}

class LocationInfo extends LocationState {
  final double? lattitude;
  final double? longitude;
  final List<geo.Placemark> placeMarks;

  LocationInfo(this.lattitude, this.longitude, this.placeMarks);
}
