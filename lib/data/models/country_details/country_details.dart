// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';


part 'country_details.freezed.dart';
part 'country_details.g.dart';
@freezed
abstract class CountryDetails with _$CountryDetails {

  const factory CountryDetails({
    @JsonKey(name: 'isoCode') required String countryIsoCode,
    @JsonKey(name: 'name') required String countryName,
      required String ip,
    @JsonKey(name: 'dial_code') required String countryCode,

  }) = _CountryDetails;

   factory CountryDetails.fromJson(Map<String, dynamic> json) => _$CountryDetailsFromJson(json);
  @override
  String toString() =>
      'CountryDetails(): {countryCode: $countryCode, code: $countryIsoCode, name: $countryName, ip: $ip}';

}
