import 'package:geolocator/geolocator.dart';
import 'package:weather/slide/waiting.dart';

import 'location.dart';
import 'http_network.dart';

var apiKey = '517eed346a6f469db42133109230105';
var link =
    'https://api.weatherapi.com/v1/current.json?key=517eed346a6f469db42133109230105&q=';
var condition = null;

class Weather {
  Future<dynamic> getCityWeather(String cityName) async {
    Network network = Network('$link$cityName');
    var weatherData = await network.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Position position = await Geolocator.getCurrentPosition();
    Network network =
        Network('$link${position.latitude},${position.longitude}');
    var weatherData = await network.getData();
    return weatherData;
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
