part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();

  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();

  @override
  List<Object> get props => [];
}

class WeatherLoaded extends WeatherState {
  final Weather? weather;

  const WeatherLoaded({@required this.weather});

  @override
  List<Object> get props => [weather!];
}

class WeatherError extends WeatherState {
  final String? error;

  const WeatherError({@required this.error});

  @override
  List<Object> get props => [error!];
}