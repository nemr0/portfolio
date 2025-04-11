// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_contact_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddContactState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddContactState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddContactState()';
}


}

/// @nodoc
class $AddContactStateCopyWith<$Res>  {
$AddContactStateCopyWith(AddContactState _, $Res Function(AddContactState) __);
}


/// @nodoc


class AddContactInitial implements AddContactState {
  const AddContactInitial({this.focus = false});
  

@JsonKey() final  bool focus;

/// Create a copy of AddContactState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddContactInitialCopyWith<AddContactInitial> get copyWith => _$AddContactInitialCopyWithImpl<AddContactInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddContactInitial&&(identical(other.focus, focus) || other.focus == focus));
}


@override
int get hashCode => Object.hash(runtimeType,focus);

@override
String toString() {
  return 'AddContactState.initial(focus: $focus)';
}


}

/// @nodoc
abstract mixin class $AddContactInitialCopyWith<$Res> implements $AddContactStateCopyWith<$Res> {
  factory $AddContactInitialCopyWith(AddContactInitial value, $Res Function(AddContactInitial) _then) = _$AddContactInitialCopyWithImpl;
@useResult
$Res call({
 bool focus
});




}
/// @nodoc
class _$AddContactInitialCopyWithImpl<$Res>
    implements $AddContactInitialCopyWith<$Res> {
  _$AddContactInitialCopyWithImpl(this._self, this._then);

  final AddContactInitial _self;
  final $Res Function(AddContactInitial) _then;

/// Create a copy of AddContactState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? focus = null,}) {
  return _then(AddContactInitial(
focus: null == focus ? _self.focus : focus // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class AddContactSaved implements AddContactState {
  const AddContactSaved();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddContactSaved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddContactState.saved()';
}


}




/// @nodoc


class AddContactLoading implements AddContactState {
  const AddContactLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddContactLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddContactState.loading()';
}


}




/// @nodoc


class AddContactSuccess implements AddContactState {
  const AddContactSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddContactSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddContactState.success()';
}


}




/// @nodoc


class AddContactFailed implements AddContactState {
  const AddContactFailed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddContactFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddContactState.failed()';
}


}




// dart format on
