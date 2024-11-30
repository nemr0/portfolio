// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_projects_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetProjectsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Project> data) success,
    required TResult Function(ExceptionImpl exception) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Project> data)? success,
    TResult? Function(ExceptionImpl exception)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Project> data)? success,
    TResult Function(ExceptionImpl exception)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProjectsLoading value) loading,
    required TResult Function(GetProjectsSuccess value) success,
    required TResult Function(GetProjectsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProjectsLoading value)? loading,
    TResult? Function(GetProjectsSuccess value)? success,
    TResult? Function(GetProjectsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProjectsLoading value)? loading,
    TResult Function(GetProjectsSuccess value)? success,
    TResult Function(GetProjectsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetProjectsStateCopyWith<$Res> {
  factory $GetProjectsStateCopyWith(
          GetProjectsState value, $Res Function(GetProjectsState) then) =
      _$GetProjectsStateCopyWithImpl<$Res, GetProjectsState>;
}

/// @nodoc
class _$GetProjectsStateCopyWithImpl<$Res, $Val extends GetProjectsState>
    implements $GetProjectsStateCopyWith<$Res> {
  _$GetProjectsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetProjectsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetProjectsLoadingImplCopyWith<$Res> {
  factory _$$GetProjectsLoadingImplCopyWith(_$GetProjectsLoadingImpl value,
          $Res Function(_$GetProjectsLoadingImpl) then) =
      __$$GetProjectsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetProjectsLoadingImplCopyWithImpl<$Res>
    extends _$GetProjectsStateCopyWithImpl<$Res, _$GetProjectsLoadingImpl>
    implements _$$GetProjectsLoadingImplCopyWith<$Res> {
  __$$GetProjectsLoadingImplCopyWithImpl(_$GetProjectsLoadingImpl _value,
      $Res Function(_$GetProjectsLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetProjectsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetProjectsLoadingImpl implements GetProjectsLoading {
  const _$GetProjectsLoadingImpl();

  @override
  String toString() {
    return 'GetProjectsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetProjectsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Project> data) success,
    required TResult Function(ExceptionImpl exception) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Project> data)? success,
    TResult? Function(ExceptionImpl exception)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Project> data)? success,
    TResult Function(ExceptionImpl exception)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProjectsLoading value) loading,
    required TResult Function(GetProjectsSuccess value) success,
    required TResult Function(GetProjectsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProjectsLoading value)? loading,
    TResult? Function(GetProjectsSuccess value)? success,
    TResult? Function(GetProjectsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProjectsLoading value)? loading,
    TResult Function(GetProjectsSuccess value)? success,
    TResult Function(GetProjectsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GetProjectsLoading implements GetProjectsState {
  const factory GetProjectsLoading() = _$GetProjectsLoadingImpl;
}

/// @nodoc
abstract class _$$GetProjectsSuccessImplCopyWith<$Res> {
  factory _$$GetProjectsSuccessImplCopyWith(_$GetProjectsSuccessImpl value,
          $Res Function(_$GetProjectsSuccessImpl) then) =
      __$$GetProjectsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Project> data});
}

/// @nodoc
class __$$GetProjectsSuccessImplCopyWithImpl<$Res>
    extends _$GetProjectsStateCopyWithImpl<$Res, _$GetProjectsSuccessImpl>
    implements _$$GetProjectsSuccessImplCopyWith<$Res> {
  __$$GetProjectsSuccessImplCopyWithImpl(_$GetProjectsSuccessImpl _value,
      $Res Function(_$GetProjectsSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetProjectsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$GetProjectsSuccessImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Project>,
    ));
  }
}

/// @nodoc

class _$GetProjectsSuccessImpl implements GetProjectsSuccess {
  const _$GetProjectsSuccessImpl(final List<Project> data) : _data = data;

  final List<Project> _data;
  @override
  List<Project> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GetProjectsState.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProjectsSuccessImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of GetProjectsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProjectsSuccessImplCopyWith<_$GetProjectsSuccessImpl> get copyWith =>
      __$$GetProjectsSuccessImplCopyWithImpl<_$GetProjectsSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Project> data) success,
    required TResult Function(ExceptionImpl exception) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Project> data)? success,
    TResult? Function(ExceptionImpl exception)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Project> data)? success,
    TResult Function(ExceptionImpl exception)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProjectsLoading value) loading,
    required TResult Function(GetProjectsSuccess value) success,
    required TResult Function(GetProjectsError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProjectsLoading value)? loading,
    TResult? Function(GetProjectsSuccess value)? success,
    TResult? Function(GetProjectsError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProjectsLoading value)? loading,
    TResult Function(GetProjectsSuccess value)? success,
    TResult Function(GetProjectsError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetProjectsSuccess implements GetProjectsState {
  const factory GetProjectsSuccess(final List<Project> data) =
      _$GetProjectsSuccessImpl;

  List<Project> get data;

  /// Create a copy of GetProjectsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetProjectsSuccessImplCopyWith<_$GetProjectsSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetProjectsErrorImplCopyWith<$Res> {
  factory _$$GetProjectsErrorImplCopyWith(_$GetProjectsErrorImpl value,
          $Res Function(_$GetProjectsErrorImpl) then) =
      __$$GetProjectsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ExceptionImpl exception});
}

/// @nodoc
class __$$GetProjectsErrorImplCopyWithImpl<$Res>
    extends _$GetProjectsStateCopyWithImpl<$Res, _$GetProjectsErrorImpl>
    implements _$$GetProjectsErrorImplCopyWith<$Res> {
  __$$GetProjectsErrorImplCopyWithImpl(_$GetProjectsErrorImpl _value,
      $Res Function(_$GetProjectsErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetProjectsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$GetProjectsErrorImpl(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as ExceptionImpl,
    ));
  }
}

/// @nodoc

class _$GetProjectsErrorImpl implements GetProjectsError {
  const _$GetProjectsErrorImpl(this.exception);

  @override
  final ExceptionImpl exception;

  @override
  String toString() {
    return 'GetProjectsState.error(exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProjectsErrorImpl &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  /// Create a copy of GetProjectsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProjectsErrorImplCopyWith<_$GetProjectsErrorImpl> get copyWith =>
      __$$GetProjectsErrorImplCopyWithImpl<_$GetProjectsErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Project> data) success,
    required TResult Function(ExceptionImpl exception) error,
  }) {
    return error(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Project> data)? success,
    TResult? Function(ExceptionImpl exception)? error,
  }) {
    return error?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Project> data)? success,
    TResult Function(ExceptionImpl exception)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProjectsLoading value) loading,
    required TResult Function(GetProjectsSuccess value) success,
    required TResult Function(GetProjectsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProjectsLoading value)? loading,
    TResult? Function(GetProjectsSuccess value)? success,
    TResult? Function(GetProjectsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProjectsLoading value)? loading,
    TResult Function(GetProjectsSuccess value)? success,
    TResult Function(GetProjectsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GetProjectsError implements GetProjectsState {
  const factory GetProjectsError(final ExceptionImpl exception) =
      _$GetProjectsErrorImpl;

  ExceptionImpl get exception;

  /// Create a copy of GetProjectsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetProjectsErrorImplCopyWith<_$GetProjectsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
