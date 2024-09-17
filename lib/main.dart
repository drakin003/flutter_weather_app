import 'package:flutter/material.dart';
import 'package:weather_app/widgets/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: "Weather App",
    theme: ThemeData.dark(),
    home: const HomePage(),
  ));
}
