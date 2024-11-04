import 'package:clean_architecture/presentation/bloc/weather_bloc.dart';
import 'package:clean_architecture/presentation/pages/weather_page.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/data_sources/weather_remote_datasource.dart';
import 'data/repositories/weather_repository_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => WeatherBloc(
          repository: WeatherRepositoryImpl(
            remoteDataSource: WeatherRemoteDataSource(
              dio: Dio()..interceptors.add(LogInterceptor()),
            ),
          ),
        ),
        child: const WeatherPage(),
      ),
    );
  }
}
