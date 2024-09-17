import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import "package:weather_app/utils/constants.dart";
import "package:weather_app/widgets/weather_model.dart";

class WeatherService {
  Future<Weather?> getWeatherData(String cityName) async {
    String url =
        '${Constants.cityBaseUrl}?q=$cityName&appid=${Constants.apiKey}&units=metric';
    try {
      var res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        return Weather.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      Center(
          child: Text(
        "Error: ${e.toString()}",
        style: const TextStyle(fontSize: 24),
      ));
    }
    return null;
  }
}
