import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weathapp/data/api_config/weather_repository.dart';
import 'package:weathapp/data/models/WeatherModel.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherIsLoading());
      try {
        WeatherModel _weatherSuccess =
            await weatherRepository.getWeather(event._city);
        emit(WeatherSuccess(_weatherSuccess));
      } catch (_) {
        emit(WeatherIsFail());
      }
    });
  }
}
