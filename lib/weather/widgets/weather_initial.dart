import 'package:flutter/material.dart';

class WeatherInitial extends StatelessWidget {
  const WeatherInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('☀️', style: TextStyle(fontSize: 64)),
        Text(
          'Welcome!',
          style: theme.textTheme.headline5,
        ),
      ],
    );
  }
}
