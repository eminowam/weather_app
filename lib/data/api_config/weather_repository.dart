import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weathapp/data/models/WeatherModel.dart';

class WeatherRepository {
  final url = 'https://api.openweathermap.org/data/2.5/';
  final api_key = '95a07a0e4e122cb65029634edb22bdbb';

  Future<WeatherModel> getWeather(String city) async {
    try {
      print(url + "weather?q=$city&appid=" + api_key);
      var response =
          await http.get(Uri.parse(url + "weather?q=$city&appid=" + api_key));
      var jsonResult = json.decode(response.body);
      print(jsonResult);
      return WeatherModel.fromJson(jsonResult);
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }
}
