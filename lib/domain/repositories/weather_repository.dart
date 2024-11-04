import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../data/models/weather_model.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherModel>> getWeather(double lat, double lon);
}
