import 'package:flutter/material.dart';
import 'package:weathapp/data/models/WeatherModel.dart';

class ShowWeather extends StatelessWidget {
  final WeatherModel weather;
  final String city;

  const ShowWeather({super.key, required this.city, required this.weather});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            city,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Good Morning",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
          ),
          // getWeatherIcon(state.weather.weatherConditionCode!),
          Center(
            child: Text(
              weather.main.temp.round().toString() + "°C",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 55,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Center(
            child: Text(''
                // weather.weatherModel.des
                // state.weatherModel.weatherMain!.toUpperCase(),
                // style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 35,
                //     fontWeight: FontWeight.w500),
                ),
          ),
          SizedBox(
            height: 5,
          ),
          // Center(
          //   child: Text(
          //     DateFormat('EEEE d / ')
          //         .add_jm()
          //         .format(state.weatherModel.date!),
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 16,
          //         fontWeight: FontWeight.w300),
          //   ),
          // ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/11.png',
                    scale: 8,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sunrise",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 3),
                      Text(
                        weather.sys.sunrise.round().toString(),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/12.png',
                    scale: 8,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sunset",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 3),
                      Text(
                        weather.sys.sunset.round().toString(),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Divider(
                color: Colors.grey,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/13.png',
                    scale: 8,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Temp Max",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 3),
                      Text(
                        weather.main.tempMax.round().toString() + "°C",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/14.png',
                    scale: 8,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Temp Min",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 3),
                      Text(
                        weather.main.tempMin.round().toString() + "°C",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
