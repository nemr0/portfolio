// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_projects_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetProjectsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProjectsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetProjectsState()';
}


}

/// @nodoc
class $GetProjectsStateCopyWith<$Res>  {
$GetProjectsStateCopyWith(GetProjectsState _, $Res Function(GetProjectsState) __);
}


/// @nodoc


class GetProjectsLoading implements GetProjectsState {
  const GetProjectsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProjectsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetProjectsState.loading()';
}


}




/// @nodoc


class GetProjectsSuccess implements GetProjectsState {
  const GetProjectsSuccess(final  List<Project> data): _data = data;
  

 final  List<Project> _data;
 List<Project> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of GetProjectsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetProjectsSuccessCopyWith<GetProjectsSuccess> get copyWith => _$GetProjectsSuccessCopyWithImpl<GetProjectsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProjectsSuccess&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'GetProjectsState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $GetProjectsSuccessCopyWith<$Res> implements $GetProjectsStateCopyWith<$Res> {
  factory $GetProjectsSuccessCopyWith(GetProjectsSuccess value, $Res Function(GetProjectsSuccess) _then) = _$GetProjectsSuccessCopyWithImpl;
@useResult
$Res call({
 List<Project> data
});




}
/// @nodoc
class _$GetProjectsSuccessCopyWithImpl<$Res>
    implements $GetProjectsSuccessCopyWith<$Res> {
  _$GetProjectsSuccessCopyWithImpl(this._self, this._then);

  final GetProjectsSuccess _self;
  final $Res Function(GetProjectsSuccess) _then;

/// Create a copy of GetProjectsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(GetProjectsSuccess(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Project>,
  ));
}


}

/// @nodoc


class GetProjectsError implements GetProjectsState {
  const GetProjectsError(this.exception);
  

 final  ExceptionImpl exception;

/// Create a copy of GetProjectsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetProjectsErrorCopyWith<GetProjectsError> get copyWith => _$GetProjectsErrorCopyWithImpl<GetProjectsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProjectsError&&(identical(other.exception, exception) || other.exception == exception));
}


@override
int get hashCode => Object.hash(runtimeType,exception);

@override
String toString() {
  return 'GetProjectsState.error(exception: $exception)';
}


}

/// @nodoc
abstract mixin class $GetProjectsErrorCopyWith<$Res> implements $GetProjectsStateCopyWith<$Res> {
  factory $GetProjectsErrorCopyWith(GetProjectsError value, $Res Function(GetProjectsError) _then) = _$GetProjectsErrorCopyWithImpl;
@useResult
$Res call({
 ExceptionImpl exception
});




}
/// @nodoc
class _$GetProjectsErrorCopyWithImpl<$Res>
    implements $GetProjectsErrorCopyWith<$Res> {
  _$GetProjectsErrorCopyWithImpl(this._self, this._then);

  final GetProjectsError _self;
  final $Res Function(GetProjectsError) _then;

/// Create a copy of GetProjectsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? exception = null,}) {
  return _then(GetProjectsError(
null == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as ExceptionImpl,
  ));
}


}

// dart format on
