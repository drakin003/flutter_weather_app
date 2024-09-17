class Weather {
  final double currenttemp;
  final String description;
  final double windSpeed;
  final int humidity;
  final String iconCode;

  Weather(
      {required this.currenttemp,
      required this.description,
      required this.windSpeed,
      required this.humidity,
      required this.iconCode});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        currenttemp: json['main']['temp'].toDouble(),
        description: json['weather'][0]['description'],
        windSpeed: json['wind']['speed'].toDouble(),
        humidity: json['main']['humidity'],
        iconCode: json['weather'][0]['icon']);
  }
}
