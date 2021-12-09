class LocationNotFoundException implements Exception {
  LocationNotFoundException([this.message]);
  String? message;
}

class WeatherNotFoundException implements Exception {
  WeatherNotFoundException([this.message]);
  String? message;
}