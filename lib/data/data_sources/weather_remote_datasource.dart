import 'package:dio/dio.dart';

import '../../core/constants/api_constants.dart';
import '../../core/error/failures.dart';
import '../models/weather_model.dart';

class WeatherRemoteDataSource {
  final Dio dio;

  WeatherRemoteDataSource({required this.dio});

  Future<WeatherModel> getWeather(double lat, double lon) async {
    try {
      final response = await dio.get(
        '${ApiConstants.baseUrl}/current.json',
        queryParameters: {
          'key': ApiConstants.apiKey,
          'q': '$lat,$lon',
        },
      );
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerFailure(e.message ?? 'Failed to fetch weather data');
    }
  }
}
