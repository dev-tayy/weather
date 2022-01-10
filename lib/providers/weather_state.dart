import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/core/service/exceptions/network_exceptions.dart';

part 'weather_state.freezed.dart';

@freezed
abstract class WeatherState<T> with _$WeatherState<T> {
  const factory WeatherState.idle() = Idle<T>;

  const factory WeatherState.loading() = Loading<T>;

  const factory WeatherState.data({required T data}) = Data<T>;

  const factory WeatherState.error({required NetworkExceptions error}) =
      Error<T>;
}
