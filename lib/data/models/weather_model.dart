import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  final double temperature;
  final String condition;

  const WeatherModel({
    required this.temperature,
    required this.condition,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: json['current']['temp_c'].toDouble(),
      condition: json['current']['condition']['text'],
    );
  }

  @override
  List<Object?> get props => [temperature, condition];
}
