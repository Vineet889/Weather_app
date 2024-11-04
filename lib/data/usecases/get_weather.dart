import '../models/weather_model.dart';
import '../repositories/weather_repository.dart';

class GetWeather {
  final WeatherRepository _weatherRepository;

  GetWeather(this._weatherRepository);

  Future<WeatherModel> execute(String location) async {
    return await _weatherRepository.getWeather(location);
  }
}
