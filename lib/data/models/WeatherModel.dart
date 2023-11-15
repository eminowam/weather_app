
class WeatherModel{
  final int id;
  final String name;
  final List<Weather> weatherModel;
  final Sys sys;
  final MainWeather main;

  WeatherModel({
    required this.id,
    required this.name,
    required this.weatherModel,
    required this.sys,
    required this.main});

  factory WeatherModel.fromJson(Map<String, dynamic> json){
    return WeatherModel(
        id: json['id'],
        name: json['name'],
        weatherModel: List<Weather>.from(json['weather'].map((data) => Weather.fromJson(data))),
        sys: Sys.fromJson(json['sys']),
      main: MainWeather.fromJson(json['main']),
    );
  }

}

class Weather{
  final String description;

  Weather({
    required this.description});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      description: json['description'],
    );
  }
}

class MainWeather{
  final double temp;
  final double tempMin;
  final double tempMax;

  MainWeather({
    required this.temp,
    required this.tempMin,
    required this.tempMax});

  factory MainWeather.fromJson(Map<String, dynamic> json) {
    return MainWeather(
      temp: json['temp'],
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
    );
  }
}

class Sys{
  final int sunrise;
  final int sunset;

  Sys({
    required this.sunrise,
    required this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }

}