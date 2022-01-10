// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weather_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WeatherStateTearOff {
  const _$WeatherStateTearOff();

  Idle<Weather> idle<Weather>() {
    return Idle<Weather>();
  }

  Loading<Weather> loading<Weather>() {
    return Loading<Weather>();
  }

  Data<Weather> data<Weather>({required Weather data}) {
    return Data<Weather>(
      data: data,
    );
  }

  Error<Weather> error<Weather>({required NetworkExceptions error}) {
    return Error<Weather>(
      error: error,
    );
  }
}

/// @nodoc
const $WeatherState = _$WeatherStateTearOff();

/// @nodoc
mixin _$WeatherState<Weather> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(Weather data) data,
    required TResult Function(NetworkExceptions error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(Weather data)? data,
    TResult Function(NetworkExceptions error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(Weather data)? data,
    TResult Function(NetworkExceptions error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<Weather> value) idle,
    required TResult Function(Loading<Weather> value) loading,
    required TResult Function(Data<Weather> value) data,
    required TResult Function(Error<Weather> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle<Weather> value)? idle,
    TResult Function(Loading<Weather> value)? loading,
    TResult Function(Data<Weather> value)? data,
    TResult Function(Error<Weather> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<Weather> value)? idle,
    TResult Function(Loading<Weather> value)? loading,
    TResult Function(Data<Weather> value)? data,
    TResult Function(Error<Weather> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherStateCopyWith<Weather, $Res> {
  factory $WeatherStateCopyWith(WeatherState<Weather> value,
          $Res Function(WeatherState<Weather>) then) =
      _$WeatherStateCopyWithImpl<Weather, $Res>;
}

/// @nodoc
class _$WeatherStateCopyWithImpl<Weather, $Res>
    implements $WeatherStateCopyWith<Weather, $Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  final WeatherState<Weather> _value;
  // ignore: unused_field
  final $Res Function(WeatherState<Weather>) _then;
}

/// @nodoc
abstract class $IdleCopyWith<Weather, $Res> {
  factory $IdleCopyWith(
          Idle<Weather> value, $Res Function(Idle<Weather>) then) =
      _$IdleCopyWithImpl<Weather, $Res>;
}

/// @nodoc
class _$IdleCopyWithImpl<Weather, $Res>
    extends _$WeatherStateCopyWithImpl<Weather, $Res>
    implements $IdleCopyWith<Weather, $Res> {
  _$IdleCopyWithImpl(Idle<Weather> _value, $Res Function(Idle<Weather>) _then)
      : super(_value, (v) => _then(v as Idle<Weather>));

  @override
  Idle<Weather> get _value => super._value as Idle<Weather>;
}

/// @nodoc

class _$Idle<Weather> with DiagnosticableTreeMixin implements Idle<Weather> {
  const _$Idle();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherState<$Weather>.idle()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'WeatherState<$Weather>.idle'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Idle<Weather>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(Weather data) data,
    required TResult Function(NetworkExceptions error) error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(Weather data)? data,
    TResult Function(NetworkExceptions error)? error,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(Weather data)? data,
    TResult Function(NetworkExceptions error)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<Weather> value) idle,
    required TResult Function(Loading<Weather> value) loading,
    required TResult Function(Data<Weather> value) data,
    required TResult Function(Error<Weather> value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle<Weather> value)? idle,
    TResult Function(Loading<Weather> value)? loading,
    TResult Function(Data<Weather> value)? data,
    TResult Function(Error<Weather> value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<Weather> value)? idle,
    TResult Function(Loading<Weather> value)? loading,
    TResult Function(Data<Weather> value)? data,
    TResult Function(Error<Weather> value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle<Weather> implements WeatherState<Weather> {
  const factory Idle() = _$Idle<Weather>;
}

/// @nodoc
abstract class $LoadingCopyWith<Weather, $Res> {
  factory $LoadingCopyWith(
          Loading<Weather> value, $Res Function(Loading<Weather>) then) =
      _$LoadingCopyWithImpl<Weather, $Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<Weather, $Res>
    extends _$WeatherStateCopyWithImpl<Weather, $Res>
    implements $LoadingCopyWith<Weather, $Res> {
  _$LoadingCopyWithImpl(
      Loading<Weather> _value, $Res Function(Loading<Weather>) _then)
      : super(_value, (v) => _then(v as Loading<Weather>));

  @override
  Loading<Weather> get _value => super._value as Loading<Weather>;
}

/// @nodoc

class _$Loading<Weather>
    with DiagnosticableTreeMixin
    implements Loading<Weather> {
  const _$Loading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherState<$Weather>.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeatherState<$Weather>.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Loading<Weather>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(Weather data) data,
    required TResult Function(NetworkExceptions error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(Weather data)? data,
    TResult Function(NetworkExceptions error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(Weather data)? data,
    TResult Function(NetworkExceptions error)? error,
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
    required TResult Function(Idle<Weather> value) idle,
    required TResult Function(Loading<Weather> value) loading,
    required TResult Function(Data<Weather> value) data,
    required TResult Function(Error<Weather> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle<Weather> value)? idle,
    TResult Function(Loading<Weather> value)? loading,
    TResult Function(Data<Weather> value)? data,
    TResult Function(Error<Weather> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<Weather> value)? idle,
    TResult Function(Loading<Weather> value)? loading,
    TResult Function(Data<Weather> value)? data,
    TResult Function(Error<Weather> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<Weather> implements WeatherState<Weather> {
  const factory Loading() = _$Loading<Weather>;
}

/// @nodoc
abstract class $DataCopyWith<Weather, $Res> {
  factory $DataCopyWith(
          Data<Weather> value, $Res Function(Data<Weather>) then) =
      _$DataCopyWithImpl<Weather, $Res>;
  $Res call({Weather data});
}

/// @nodoc
class _$DataCopyWithImpl<Weather, $Res>
    extends _$WeatherStateCopyWithImpl<Weather, $Res>
    implements $DataCopyWith<Weather, $Res> {
  _$DataCopyWithImpl(Data<Weather> _value, $Res Function(Data<Weather>) _then)
      : super(_value, (v) => _then(v as Data<Weather>));

  @override
  Data<Weather> get _value => super._value as Data<Weather>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(Data<Weather>(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Weather,
    ));
  }
}

/// @nodoc

class _$Data<Weather> with DiagnosticableTreeMixin implements Data<Weather> {
  const _$Data({required this.data});

  @override
  final Weather data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherState<$Weather>.data(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeatherState<$Weather>.data'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Data<Weather> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  $DataCopyWith<Weather, Data<Weather>> get copyWith =>
      _$DataCopyWithImpl<Weather, Data<Weather>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(Weather data) data,
    required TResult Function(NetworkExceptions error) error,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(Weather data)? data,
    TResult Function(NetworkExceptions error)? error,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(Weather data)? data,
    TResult Function(NetworkExceptions error)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<Weather> value) idle,
    required TResult Function(Loading<Weather> value) loading,
    required TResult Function(Data<Weather> value) data,
    required TResult Function(Error<Weather> value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle<Weather> value)? idle,
    TResult Function(Loading<Weather> value)? loading,
    TResult Function(Data<Weather> value)? data,
    TResult Function(Error<Weather> value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<Weather> value)? idle,
    TResult Function(Loading<Weather> value)? loading,
    TResult Function(Data<Weather> value)? data,
    TResult Function(Error<Weather> value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class Data<Weather> implements WeatherState<Weather> {
  const factory Data({required Weather data}) = _$Data<Weather>;

  Weather get data;
  @JsonKey(ignore: true)
  $DataCopyWith<Weather, Data<Weather>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorCopyWith<Weather, $Res> {
  factory $ErrorCopyWith(
          Error<Weather> value, $Res Function(Error<Weather>) then) =
      _$ErrorCopyWithImpl<Weather, $Res>;
  $Res call({NetworkExceptions error});

  $NetworkExceptionsCopyWith<$Res> get error;
}

/// @nodoc
class _$ErrorCopyWithImpl<Weather, $Res>
    extends _$WeatherStateCopyWithImpl<Weather, $Res>
    implements $ErrorCopyWith<Weather, $Res> {
  _$ErrorCopyWithImpl(
      Error<Weather> _value, $Res Function(Error<Weather>) _then)
      : super(_value, (v) => _then(v as Error<Weather>));

  @override
  Error<Weather> get _value => super._value as Error<Weather>;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(Error<Weather>(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as NetworkExceptions,
    ));
  }

  @override
  $NetworkExceptionsCopyWith<$Res> get error {
    return $NetworkExceptionsCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$Error<Weather> with DiagnosticableTreeMixin implements Error<Weather> {
  const _$Error({required this.error});

  @override
  final NetworkExceptions error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherState<$Weather>.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeatherState<$Weather>.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Error<Weather> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $ErrorCopyWith<Weather, Error<Weather>> get copyWith =>
      _$ErrorCopyWithImpl<Weather, Error<Weather>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(Weather data) data,
    required TResult Function(NetworkExceptions error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(Weather data)? data,
    TResult Function(NetworkExceptions error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(Weather data)? data,
    TResult Function(NetworkExceptions error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<Weather> value) idle,
    required TResult Function(Loading<Weather> value) loading,
    required TResult Function(Data<Weather> value) data,
    required TResult Function(Error<Weather> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle<Weather> value)? idle,
    TResult Function(Loading<Weather> value)? loading,
    TResult Function(Data<Weather> value)? data,
    TResult Function(Error<Weather> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<Weather> value)? idle,
    TResult Function(Loading<Weather> value)? loading,
    TResult Function(Data<Weather> value)? data,
    TResult Function(Error<Weather> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<Weather> implements WeatherState<Weather> {
  const factory Error({required NetworkExceptions error}) = _$Error<Weather>;

  NetworkExceptions get error;
  @JsonKey(ignore: true)
  $ErrorCopyWith<Weather, Error<Weather>> get copyWith =>
      throw _privateConstructorUsedError;
}
