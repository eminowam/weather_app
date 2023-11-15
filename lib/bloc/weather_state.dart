part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final weather;

  WeatherSuccess( this.weather);

  WeatherModel get getWeather => weather;

  @override
  List<Object> get props => [weather];
}

class WeatherIsFail extends WeatherState {}
