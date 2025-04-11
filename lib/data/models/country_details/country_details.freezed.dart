// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CountryDetails {

@JsonKey(name: 'isoCode') String get countryIsoCode;@JsonKey(name: 'name') String get countryName; String get ip;@JsonKey(name: 'dial_code') String get countryCode;
/// Create a copy of CountryDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountryDetailsCopyWith<CountryDetails> get copyWith => _$CountryDetailsCopyWithImpl<CountryDetails>(this as CountryDetails, _$identity);

  /// Serializes this CountryDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountryDetails&&(identical(other.countryIsoCode, countryIsoCode) || other.countryIsoCode == countryIsoCode)&&(identical(other.countryName, countryName) || other.countryName == countryName)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,countryIsoCode,countryName,ip,countryCode);



}

/// @nodoc
abstract mixin class $CountryDetailsCopyWith<$Res>  {
  factory $CountryDetailsCopyWith(CountryDetails value, $Res Function(CountryDetails) _then) = _$CountryDetailsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'isoCode') String countryIsoCode,@JsonKey(name: 'name') String countryName, String ip,@JsonKey(name: 'dial_code') String countryCode
});




}
/// @nodoc
class _$CountryDetailsCopyWithImpl<$Res>
    implements $CountryDetailsCopyWith<$Res> {
  _$CountryDetailsCopyWithImpl(this._self, this._then);

  final CountryDetails _self;
  final $Res Function(CountryDetails) _then;

/// Create a copy of CountryDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? countryIsoCode = null,Object? countryName = null,Object? ip = null,Object? countryCode = null,}) {
  return _then(_self.copyWith(
countryIsoCode: null == countryIsoCode ? _self.countryIsoCode : countryIsoCode // ignore: cast_nullable_to_non_nullable
as String,countryName: null == countryName ? _self.countryName : countryName // ignore: cast_nullable_to_non_nullable
as String,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CountryDetails implements CountryDetails {
  const _CountryDetails({@JsonKey(name: 'isoCode') required this.countryIsoCode, @JsonKey(name: 'name') required this.countryName, required this.ip, @JsonKey(name: 'dial_code') required this.countryCode});
  factory _CountryDetails.fromJson(Map<String, dynamic> json) => _$CountryDetailsFromJson(json);

@override@JsonKey(name: 'isoCode') final  String countryIsoCode;
@override@JsonKey(name: 'name') final  String countryName;
@override final  String ip;
@override@JsonKey(name: 'dial_code') final  String countryCode;

/// Create a copy of CountryDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountryDetailsCopyWith<_CountryDetails> get copyWith => __$CountryDetailsCopyWithImpl<_CountryDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountryDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountryDetails&&(identical(other.countryIsoCode, countryIsoCode) || other.countryIsoCode == countryIsoCode)&&(identical(other.countryName, countryName) || other.countryName == countryName)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,countryIsoCode,countryName,ip,countryCode);



}

/// @nodoc
abstract mixin class _$CountryDetailsCopyWith<$Res> implements $CountryDetailsCopyWith<$Res> {
  factory _$CountryDetailsCopyWith(_CountryDetails value, $Res Function(_CountryDetails) _then) = __$CountryDetailsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'isoCode') String countryIsoCode,@JsonKey(name: 'name') String countryName, String ip,@JsonKey(name: 'dial_code') String countryCode
});




}
/// @nodoc
class __$CountryDetailsCopyWithImpl<$Res>
    implements _$CountryDetailsCopyWith<$Res> {
  __$CountryDetailsCopyWithImpl(this._self, this._then);

  final _CountryDetails _self;
  final $Res Function(_CountryDetails) _then;

/// Create a copy of CountryDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? countryIsoCode = null,Object? countryName = null,Object? ip = null,Object? countryCode = null,}) {
  return _then(_CountryDetails(
countryIsoCode: null == countryIsoCode ? _self.countryIsoCode : countryIsoCode // ignore: cast_nullable_to_non_nullable
as String,countryName: null == countryName ? _self.countryName : countryName // ignore: cast_nullable_to_non_nullable
as String,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
