import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_weather/services/http_weather.dart';
import 'package:intern_weather/services/open_weather_api.dart';
import 'package:http/http.dart' as http;

import '../data/forecast_data.dart';
import '../data/weather_data.dart';

/// Providers used by rest of the app
final weatherProvider = Provider<HttpWeatherRepository>((ref) {
  return HttpWeatherRepository(
    api: OpenWeatherMapAPI(APIKeys.openWeatherAPIKey),
    client: http.Client(),
  );
});

final cityProvider = StateProvider<String>((ref) {
  return 'Naypyidaw';
});

final currentWeatherProvider =
    FutureProvider.autoDispose<WeatherData>((ref) async {
  final city = ref.watch(cityProvider);
  final weather = await ref.watch(weatherProvider).getWeather(city: city);
  return WeatherData.from(weather);
});

final hourlyWeatherProvider = FutureProvider.autoDispose<ForecastData>((ref) async {
  final city = ref.watch(cityProvider);
  final forecast = await ref.watch(weatherProvider).getForecast(city: city);
  return ForecastData.from(forecast);
});
