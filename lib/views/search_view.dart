// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('search city'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Center(
          child: TextField(
            onSubmitted: (value) {
              BlocProvider.of<GetWeatherCubit>(context).getWeather(cityName: value);
              Navigator.of(context).pop();
            },
            decoration: const InputDecoration(
              hintText: 'Enter City Name',
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}


