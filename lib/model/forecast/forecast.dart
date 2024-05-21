
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intern_weather/model/weather/weather.dart';
part 'forecast.g.dart';
part 'forecast.freezed.dart';

/// Forecast data parsed from the API response (not used directly in the UI)
@Freezed()
class ForecastClass with _$ForecastClass {
  factory ForecastClass({
    required List<WeatherClass> list,
  }) = _ForecastClass;

  factory ForecastClass.fromJson(Map<String, dynamic> json) =>
      _$ForecastClassFromJson(json);
}
