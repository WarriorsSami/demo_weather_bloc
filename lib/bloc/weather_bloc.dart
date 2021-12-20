
import 'package:bloc/bloc.dart';
import 'package:demo_weather_bloc/data/model/weather.dart';
import 'package:demo_weather_bloc/data/weather_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(const WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if (event is GetWeather) {
        emit(const WeatherLoading());

        await weatherRepository.fetchWeather(event.cityName!).then((weather) {
          emit(WeatherLoaded(weather: weather));
        }).catchError((error) {
          emit(WeatherError(error: error.toString()));
        });
      } else if (event is GetDetailedWeather) {
        emit(const WeatherLoading());

        await weatherRepository.fetchDetailedWeather(event.cityName!).then((weather) {
          emit(WeatherLoaded(weather: weather));
        }).catchError((error) {
          emit(WeatherError(error: "Couldn't fetch weather! Are you online?\nErr: ${error.toString()}"));
        });
      }
    });
  }
}
