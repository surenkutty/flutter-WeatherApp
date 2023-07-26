import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApiService {
  final String apiKey = '25d837617eee49ed92544423230707';

  Future<Map<String, dynamic>> fetchWeatherData(String city) async {
    final response = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }
}
