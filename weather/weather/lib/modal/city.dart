


class City{
  City({required this.longitude, required this.latitude, required this.coutryName, required this.stateName, required this.cityName });

  final longitude;
  final latitude;
  final cityName;
  final coutryName;
  final stateName;

  String get lon => longitude;
  String get lat => latitude;
  String get city => cityName;
  String get country => coutryName;
  String get state => stateName;
}