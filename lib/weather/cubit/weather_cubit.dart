import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:practical_weather/weather/models/models.dart';
import 'package:repositories/weather_repository.dart' show WeatherRepository;

part 'weather_cubit.g.dart';
part 'weather_state.dart';

class WeatherCubit extends HydratedCubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(WeatherState());

  void reset() {
    emit(state.copyWith(status: WeatherStatus.initial));
  }

  Future<void> fetchWeather(String cityName) async {
    if(cityName.isEmpty)
      return;

    emit(state.copyWith(status: WeatherStatus.loading));

    try {
      final weather = Weather.fromRepository(
        await _weatherRepository.getWeather(cityName)
      );

      final tempUnits = state.temperatureUnits;
      final tempValue = tempUnits.isFahrenheit
        ? weather.temperature.value.toFahrenheit()
        : weather.temperature.value;

      emit(state.copyWith(
          status: WeatherStatus.success,
          temperatureUnits: tempUnits,
          weather: weather.copyWith(temperature: Temperature(value: tempValue)
      )));
    } catch (ex) {
      print(ex);
      emit(state.copyWith(status: WeatherStatus.failure));
    }
  }

  Future<void> refreshWeather() async {
    if (!state.status.isSuccess) return;
    if (state.weather == Weather.empty) return;
    try {
      final weather = Weather.fromRepository(
        await _weatherRepository.getWeather(state.weather.location.cityName),
      );
      final units = state.temperatureUnits;
      final value = units.isFahrenheit
          ? weather.temperature.value.toFahrenheit()
          : weather.temperature.value;

      emit(
        state.copyWith(
          status: WeatherStatus.success,
          temperatureUnits: units,
          weather: weather.copyWith(temperature: Temperature(value: value)),
        ),
      );
    } on Exception {
      emit(state);
    }
  }

  /// Toggle [temperatureUnits] between C and F
  void toggleUnits() {
    final units = state.temperatureUnits.isFahrenheit
        ? TemperatureUnits.celsius
        : TemperatureUnits.fahrenheit;

    if (!state.status.isSuccess) {
      emit(state.copyWith(temperatureUnits: units));
      return;
    }

    final weather = state.weather;
    if (weather != Weather.empty) {
      final temperature = weather.temperature;
      final value = units.isCelsius
          ? temperature.value.toCelsius()
          : temperature.value.toFahrenheit();
      emit(
        state.copyWith(
          temperatureUnits: units,
          weather: weather.copyWith(temperature: Temperature(value: value)),
        ),
      );
    }
  }

  @override
  WeatherState? fromJson(Map<String, dynamic> json) {
    WeatherState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(WeatherState state) => state.toJson();
}

extension on double {
  double toFahrenheit() => ((this * 9 / 5) + 32);
  double toCelsius() => ((this - 32) * 5 / 9);
}