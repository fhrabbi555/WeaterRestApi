import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApiService {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String apiKey = '3452c44ae0f59b20fe5d700778017e5e'; // Replace with your OpenWeatherMap API key

  static Future<Map<String, dynamic>> getWeatherForecast(double latitude, double longitude) async {
    final response = await http.get(
      Uri.parse('$baseUrl/forecast?lat=$latitude&lon=$longitude&appid=$apiKey'),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return json.decode(response.body);
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load weather forecast');
    }
  }
}
