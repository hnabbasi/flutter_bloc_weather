library repositories;

import 'package:data/weather_service.dart';
import 'models/models.dart';

class WeatherRepository {
  final WeatherService weatherService;

  WeatherRepository({WeatherService? weatherService})
      : weatherService = weatherService ?? WeatherService();

  Future<Weather> getWeather(String city) async {
    var dto = await this.weatherService.getLatestWeather(city);

    return Weather(
      location: Location(
          cityName: dto.location.cityName,
          stateName: dto.location.stateName,
          cwa: dto.location.cwa,
          forecastUrl: dto.location.forecastUrl,
          gridX: dto.location.gridX,
          gridY: dto.location.gridY,
          hourlyForecastUrl: dto.location.hourlyForecastUrl,
          lat: dto.location.lat,
          long: dto.location.long,
          observationStations: dto.location.observationStations),
      timestamp: dto.timestamp,
      textDescription: dto.textDescription,
      temperature: UnitValue(unit: dto.temperature.unitCode, value: dto.temperature.value),
      dewPoint: UnitValue(unit: dto.dewpoint.unitCode, value: dto.dewpoint.value),
      heatIndex: UnitValue(unit: dto.heatIndex.unitCode, value: dto.heatIndex.value),
      relativeHumidity: UnitValue(unit: dto.relativeHumidity.unitCode, value: dto.relativeHumidity.value),
      windSpeed: UnitValue(unit: dto.relativeHumidity.unitCode, value: dto.relativeHumidity.value),
      icon: dto.icon,
      visibility: UnitValue(unit: dto.visibility.unitCode, value: dto.visibility.value),
      windChill: UnitValue(unit: dto.windChill.unitCode, value: dto.windChill.value),
      windDirection: UnitValue(unit: dto.windDirection.unitCode, value: dto.windDirection.value)
    );
  }
}
