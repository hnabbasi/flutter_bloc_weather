import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practical_weather/theme/cubit/theme_cubit.dart';
import 'package:practical_weather/weather/views/weather_page.dart';
import 'package:repositories/weather_repository.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key, required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository,
        super(key: key);

  final WeatherRepository _weatherRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _weatherRepository,
      child: BlocProvider(
        create: (_) => ThemeCubit(),
        child: WeatherAppView(),
      ),
    );
  }
}

class WeatherAppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<ThemeCubit, Color>(
      builder: (context, color) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: color,
            textTheme: GoogleFonts.robotoTextTheme(),
            appBarTheme: AppBarTheme(
              titleTextStyle: GoogleFonts.robotoTextTheme(textTheme)
                  .apply(bodyColor: Colors.white)
                  .headline6,
            ),
          ),
          home: WeatherPage(),
        );
      },
    );
  }
}