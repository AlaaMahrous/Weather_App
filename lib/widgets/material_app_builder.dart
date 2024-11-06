import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/widgets/custom_material_app.dart';

class MaterialAppBuilder extends StatelessWidget {
  const MaterialAppBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherStates>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          String condition = BlocProvider.of<GetWeatherCubit>(context)
        .weatherModel
        .current
        .condition
        .text;
          return CustomMaterialApp(color: getThemeColor(condition));
        }else{
          return const CustomMaterialApp(color: Colors.green);
        }
      },
    );
  }
}
MaterialColor getThemeColor(String condition) {
    if (condition == 'Sunny') {
      return Colors.yellow;
    } else if (condition == 'Sunny') {
      return Colors.yellow;
    } else if (condition == 'Clear') {
      return Colors.lightBlue;
    } else if (condition == 'Light rain' ||
        condition == 'Moderate rain' ||
        condition == 'Heavy rain') {
      return Colors.blue;
    } else if (condition == 'Partly cloudy' ||
        condition == 'Cloudy' ||
        condition == 'Overcast') {
      return Colors.blueGrey;
    } else {
      return Colors.grey;
    }
  }


