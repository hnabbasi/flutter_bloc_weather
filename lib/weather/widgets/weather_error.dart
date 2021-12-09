import 'package:flutter/material.dart';
import 'package:practical_weather/weather/cubit/weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherError extends StatelessWidget {
  const WeatherError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('🙈', style: TextStyle(fontSize: 64)),
        Text(
          'Something went wrong!',
          style: theme.textTheme.headline5,
        ),
        SizedBox(height: 48),
        OutlinedButton(
          onPressed: () {
              context.read<WeatherCubit>().reset();
            },
          child: const Text('Try again')),
      ],
    );
  }
}
