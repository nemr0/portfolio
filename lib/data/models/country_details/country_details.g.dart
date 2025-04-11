// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CountryDetails _$CountryDetailsFromJson(Map<String, dynamic> json) =>
    _CountryDetails(
      countryIsoCode: json['isoCode'] as String,
      countryName: json['name'] as String,
      ip: json['ip'] as String,
      countryCode: json['dial_code'] as String,
    );

Map<String, dynamic> _$CountryDetailsToJson(_CountryDetails instance) =>
    <String, dynamic>{
      'isoCode': instance.countryIsoCode,
      'name': instance.countryName,
      'ip': instance.ip,
      'dial_code': instance.countryCode,
    };
