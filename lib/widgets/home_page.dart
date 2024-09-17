import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_services.dart';
import 'package:weather_app/widgets/weather_display.dart';
import 'package:weather_app/widgets/weather_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String cityName = "";
  Weather? weatherdata;
  final weatherService = WeatherService();

  void getdata() async {
    Weather? data = await weatherService.getWeatherData(cityName);
    setState(() {
      weatherdata = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Enter A City Name",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    onChanged: (value) {
                      cityName = value;
                    },
                    decoration: InputDecoration(
                      labelText: "City Name",
                      labelStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.blueAccent),
                      ),
                      prefixIcon:
                          const Icon(Icons.location_city, color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey[900],
                    ),
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: getdata,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text("Get Weather info"),
                  ),
                  const SizedBox(height: 40),
                  weatherdata != null
                      ? WeatherDisplay(weather: weatherdata!)
                      : const Text(
                          "Enter a city name to get the weather",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[900],
            child: Row(
              children: [
                Text(
                  "Weather App v1.0 - Created by ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                Text(
                  "Syed Ali Aun",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.pink.withOpacity(1.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
