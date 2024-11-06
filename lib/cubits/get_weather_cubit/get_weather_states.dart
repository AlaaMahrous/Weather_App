
import 'package:weather_app/models/weather_model.dart';

class WeatherStates {}

class InitialState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {
  WeatherLoadedState({required this.model});
  final WeatherMainModel model;
}

class WeatherLoadedFailureState extends WeatherStates {
  WeatherLoadedFailureState({required this.message});
  final String message;
}