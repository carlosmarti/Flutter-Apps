// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      name: json['name'] as String,
      region: json['region'] as String,
      country: json['country'] as String,
      current: json['current'] as Map<String, dynamic>,
      condition: json['condition'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'current': instance.current,
      'condition': instance.condition,
    };
