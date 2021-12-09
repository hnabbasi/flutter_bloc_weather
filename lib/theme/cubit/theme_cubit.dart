import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:practical_weather/weather/models/weather.dart';

class ThemeCubit extends HydratedCubit<Color> {
  ThemeCubit() : super(defaultColor);

  static const defaultColor = Colors.blueAccent;

  void updateTheme(Weather? weather) {
    if (weather != null) emit(weather.toColor);
  }

  @override
  Color? fromJson(Map<String, dynamic> json) {
    return Color(int.parse(json['color'] as String)).withAlpha(255);
  }

  @override
  Map<String, dynamic>? toJson(Color state) {
    return <String, dynamic> {'color': '${state.value}'};
  }
}

extension on Weather {
  Color get toColor => ThemeCubit.defaultColor;
  // {
  //   switch (condition) {
      // case WeatherCondition.clear:
      //   return Colors.orangeAccent;
      // case WeatherCondition.snowy:
      //   return Colors.lightBlueAccent;
      // case WeatherCondition.cloudy:
      //   return Colors.blueGrey;
      // case WeatherCondition.rainy:
      //   return Colors.indigoAccent;
      // case WeatherCondition.unknown:
      // default:
      //   return ThemeCubit.defaultColor;
    // }
  // }
}