import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:intern_weather/model/forecast/forecast.dart';

import '../model/weather/weather.dart';
import 'exceptions.dart';
import 'open_weather_api.dart';


class APIKeys {
  static const openWeatherAPIKey = 'e46ef7f8a2e7d77b6a96a50db91c02b5';
}

class HttpWeatherRepository {
  HttpWeatherRepository({required this.api, required this.client});
  final OpenWeatherMapAPI api;
  final http.Client client;

  Future<ForecastClass> getForecast({required String city}) => _getData(
        uri: api.getForecast(city),
        builder: (data) => ForecastClass.fromJson(data),
      );

  Future<WeatherClass> getWeather({required String city}) => _getData(
        uri: api.getWeather(city),
        builder: (data) => WeatherClass.fromJson(data),
      );

  Future<WeatherClass> _getData<WeatherClass>({
    required Uri uri,
    required  Function(dynamic data) builder,
  }) async {
    try {
      final response = await client.get(uri);
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return builder(data);
        case 401:
          throw InvalidApiKeyException();
        case 404:
          throw CityNotFoundException();
        default:
          throw UnknownException();
      }
    } on SocketException catch (_) {
      throw NoInternetConnectionException();
    }
  }
}

