import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/material_app_builder.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
    required this.model,
  });
  final WeatherMainModel model;
  @override
  Widget build(BuildContext context) {
  //WeatherMainModel providerModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
  //providerModel.location.name;
  String condition = model.current.condition.text;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            getThemeColor(condition).shade400,
            getThemeColor(condition).shade300,
            getThemeColor(condition).shade200,
            getThemeColor(condition).shade100,
            getThemeColor(condition).shade50,
            //Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              model.location.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'updated at ${model.location.localtime.hour-12}:${model.location.localtime.minute}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'http:${model.current.condition.icon}',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
                Text(
                  '${model.current.currentTemp.round()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp: ${model.forecast.forecastday[0].day.maxtempC.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mintemp: ${model.forecast.forecastday[0].day.mintempC.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              model.current.condition.text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*DateTime stringToDateTime (String value){
  return DateTime.parse(value);
}*/