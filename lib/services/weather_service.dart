import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '23444bc40f6f47fd9b2232154241706';
  final Dio dio;
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Oops there was an error, try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error, try later');
    }
  }
}
