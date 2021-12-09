import 'package:data/models/location.dart';
import 'package:data/weather_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('API calls', (){
    late WeatherService _weatherService;

    setUp((){
      _weatherService = WeatherService();
    });

    test('get KHOU weather for Houston', () async {
      final result = await _weatherService.getLatestWeather("Houston");
      expect(result.station.contains("KHOU"), true);
    });
    test('get Houston for lat and long provided', () async {
      final result = await _weatherService.getCoords("Houston");
      expect(result, "29.760450,-95.369781");
    });
    test('get station id for given coords', () async{
      final loc = Location(cityName: "", stateName: "", lat: 0, long: 0, cwa: "", gridX: 0, gridY: 0, forecastUrl: "", hourlyForecastUrl: "", observationStations: "https://api.weather.gov/gridpoints/HGX/64,96/stations");
      final result = await _weatherService.getStationIdForLocation(loc);
      expect(result, "KHOU");
    });
    test('get station id from coordinates', () async{
      final result = await _weatherService.getLocation("29.760450,-95.369781");
      expect(result.cityName, "Houston");
    });
    test('get station id from stations Url', () async{
      final result = await _weatherService.getFirstStationId("https://api.weather.gov/gridpoints/HGX/64,96/stations");
      expect(result, "KHOU");
    });
  });
}
