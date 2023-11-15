import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathapp/bloc/weather_bloc.dart';
import 'package:weathapp/data/api_config/weather_repository.dart';
import 'package:weathapp/views/screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final int num = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Roboto'
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocProvider(
          create: (context) => WeatherBloc(WeatherRepository()),
          child: HomeScreen(),
        ),
      ),
    );
  }
}
