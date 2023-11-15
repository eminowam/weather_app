import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathapp/bloc/weather_bloc.dart';
import 'package:weathapp/data/models/WeatherModel.dart';
import 'package:weathapp/views/widget/show_weather.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, this.weatherModel});

  WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WeatherBloc>(context).add(FetchWeather("London"));
    return Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        ),
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherIsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is WeatherIsFail) {
              return const Center(
                child: Text(
                  "Feald fetch",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            if (state is WeatherSuccess) {
              return Padding(
                  padding: const EdgeInsets.fromLTRB(
                      40, 1.2 * kToolbarHeight, 40, 20),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(3, -0.3),
                          child: Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.deepPurple),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-3, -0.3),
                          child: Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.deepPurple),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, -1.2),
                          child: Container(
                            height: 300,
                            width: 600,
                            decoration: BoxDecoration(color: Color(0xffFFAB40)),
                          ),
                        ),
                        BackdropFilter(
                          filter:
                              ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                          child: Container(
                            decoration:
                                BoxDecoration(color: Colors.transparent),
                          ),
                        ),
                        ShowWeather(
                          weather: state.weather,
                          city: 'London',
                        )
                      ],
                    ),
                  ));
            }

            return const SizedBox();
          },
        ));
  }
}
