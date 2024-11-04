import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../domain/repositories/weather_repository.dart';
import '../data_sources/weather_remote_datasource.dart';
import '../models/weather_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, WeatherModel>> getWeather(
      double lat, double lon) async {
    try {
      final weather = await remoteDataSource.getWeather(lat, lon);
      return Right(weather);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
