import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  WeatherService({
    required this.dio,
    required this.city,
  });

  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String endPoint1 = 'forecast.json';
  final String city;
  final String key = '4a66080faa5a4b8eb0395725242510';
  
  late Map<String, String> weatherServiceParameters = {
    'q': city,
    'key': key,
  };

  Future<WeatherMainModel> getCityWeather() async {
    try {
      final Response response = await dio.get(
        '$baseUrl/$endPoint1',
        queryParameters: weatherServiceParameters,
      );
      return WeatherMainModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timeout. Please try again.');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Receive timeout. Please try again.');
      } else if (e.type == DioExceptionType.badResponse && e.response?.data != null) {
        throw Exception('Error: ${e.response!.data['error']['message']}');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Data handling error: $e');
    }
  }
}
