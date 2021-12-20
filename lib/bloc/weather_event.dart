part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class GetWeather extends WeatherEvent {
  final String? cityName;

  const GetWeather({@required this.cityName});

  @override
  List<Object> get props => [cityName!];
}

class GetDetailedWeather extends WeatherEvent {
  final String? cityName;

  const GetDetailedWeather({@required this.cityName});

  @override
  List<Object> get props => [cityName!];
}
