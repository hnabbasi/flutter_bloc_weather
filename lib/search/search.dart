import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practical_weather/weather/cubit/weather_cubit.dart';

class SearchView extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  SearchView({Key? key}) : super(key: key);

  String get _text => _textController.text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Search a city ex. Chicago',
              ),
            ),
          ),
        ),
        IconButton(
          key: const Key('searchPage_search_iconButton'),
          icon: const Icon(Icons.search),
          onPressed: () async {
            await context.read<WeatherCubit>().fetchWeather(_text);
          },
        )
      ],
    );
  }
}
