// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForecastClassImpl _$$ForecastClassImplFromJson(Map<String, dynamic> json) =>
    _$ForecastClassImpl(
      list: (json['list'] as List<dynamic>)
          .map((e) => WeatherClass.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ForecastClassImplToJson(_$ForecastClassImpl instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
