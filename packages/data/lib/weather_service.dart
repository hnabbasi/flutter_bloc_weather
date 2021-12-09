library data;

import 'models/models.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherService {
  static const _baseUrl = 'api.weather.gov';
  static const _headers = <String, String>{'User-Agent':'Hussain'};
  static const _requireQC = <String, String>{'require_qc':'true'};
  final http.Client _httpClient;

  WeatherService({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<String> getCoords(String cityName) async {
    final uri = Uri.https(
        'www.metaweather.com',
        '/api/location/search/',
        <String, String>{'query': cityName.trim().toLowerCase()});

    try {
      final response = await _httpClient.get(uri);

      if (response.statusCode != 200) {
        throw LocationNotFoundException('Call to get coords failed.');
      }

      final weatherJson = jsonDecode(response.body) as List;
      return weatherJson[0]['latt_long'];
    } catch (e) {
      print(e);
      throw LocationNotFoundException('Call to get coords failed.');
    }
  }
  Future<String> getStationIdForLocation(Location location) async {
    return await getFirstStationId(location.observationStations);
  }

  Future<Location> getLocation(String lat_long) async {
    final uri = Uri.https(_baseUrl, '/points/$lat_long');

    final response = await _httpClient.get(uri, headers: _headers);

    if(response.statusCode != 200) {
      throw LocationNotFoundException('Get station id from coords failed.');
    }

    final pointJson = jsonDecode(response.body);

    return Location(
        cityName: pointJson['properties']['relativeLocation']['properties']['city'],
        stateName: pointJson['properties']['relativeLocation']['properties']['state'],
        lat: pointJson['properties']['relativeLocation']['geometry']['coordinates'][1],
        long: pointJson['properties']['relativeLocation']['geometry']['coordinates'][0],
        cwa: pointJson['properties']['cwa'],
        gridX: pointJson['properties']['gridX'],
        gridY: pointJson['properties']['gridY'],
        forecastUrl: pointJson['properties']['forecast'],
        hourlyForecastUrl: pointJson['properties']['forecastHourly'],
        observationStations: pointJson['properties']['observationStations']
    );
  }

  Future<String> getFirstStationId(String stationUrl) async {
    final stationsResponse = await _httpClient.get(Uri.parse(stationUrl), headers: _headers);

    if(stationsResponse.statusCode != 200) {
      throw LocationNotFoundException('Call to get stations failed.');
    }

    final stationsList = jsonDecode(stationsResponse.body);
    return stationsList['features'][0]['properties']['stationIdentifier'];
  }

  Future<Weather> getLatestWeather(String cityName) async {
    final coords = await getCoords(cityName);
    final location = await getLocation(coords);
    final stationId = await getStationIdForLocation(location);

    final uri = Uri.https(
        _baseUrl,
        '/stations/$stationId/observations/latest',
        _requireQC);

    final response = await _httpClient.get(uri, headers: _headers);

    if(response.statusCode != 200) {
      throw WeatherNotFoundException('Failed to get latest observations.');
    }

    final weatherJson = jsonDecode(response.body)['properties'];
    weatherJson['location'] = location.toJson();
    final result = Weather.fromJson(weatherJson);
    return result;
  }
}
