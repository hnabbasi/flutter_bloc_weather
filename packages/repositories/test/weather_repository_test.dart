import 'package:data/weather_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repositories/models/models.dart' show Weather, UnitValue;
import 'package:repositories/weather_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockWeatherService extends Mock implements WeatherService {}

void main() {
  group('Repo tests', () {
    late WeatherService _weatherService;
    late WeatherRepository _repo;

    setUp((){
      _weatherService = WeatherService(); //TODO: use Mock instead
      _repo = WeatherRepository(weatherService: _weatherService);

      // when(() => _weatherService.getLatestWeather(any<String>())
      // .whenComplete(() => new Weather(
      //     timestamp: "timestamp",
      //     textDescription: "Test",
      //     icon: "icon",
      //     temperature: UnitValue(unit:"F", value: 10),
      //     dewPoint: UnitValue(unit:"F", value: 10),
      //     windDirection: UnitValue(unit:"F", value: 10),
      //     windSpeed: UnitValue(unit:"F", value: 10),
      //     visibility: UnitValue(unit:"F", value: 10),
      //     relativeHumidity: UnitValue(unit:"F", value: 10),
      //     windChill: UnitValue(unit:"F", value: 10),
      //     heatIndex: UnitValue(unit:"F", value: 10)))
      // );
    });

    test('calling by city name returns weather', () async {
      final result = await _repo.getWeather("Houston");
      expect(result.textDescription != null, true);
    });
  });
}
