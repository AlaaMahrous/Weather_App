// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() :super(InitialState());
  late WeatherMainModel weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService(dio: Dio(), city: cityName).getCityWeather();
      emit(WeatherLoadedState(model: weatherModel));
    } on DioException catch (e) {
      emit(WeatherLoadedFailureState(
          message: e.message ?? 'There was an error'));
    }
  }
}

