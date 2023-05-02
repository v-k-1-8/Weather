import 'package:flutter/material.dart';
import 'package:weather/style.dart';
import 'package:weather/backservice/weather_finder.dart';
import 'city_screen.dart';
import 'waiting.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen(this.locationWeather);
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Weather weather = Weather();
  var temperature = 0;
  var weatherIcon = '';
  var cityName = '';
  var weatherMessage = '';
  var condition = '';
  @override
  void initState() {
    super.initState();

    updateUI(weatherData);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        return;
      }
      double temp = weatherData['current']['temp_c'];
      temperature = temp.toInt();
      condition = weatherData['current']['condition']['text'];

      weatherMessage = weather.getMessage(temperature);
      cityName = weatherData['location']['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bgw.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () async {
                        var weatherData = await weather.getLocationWeather();
                        updateUI(weatherData);
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 50.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        var typedName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CityScreen();
                            },
                          ),
                        );
                        if (typedName != null) {
                          var weatherData =
                              await weather.getCityWeather(typedName);
                          updateUI(weatherData);
                        }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    '$temperature°',
                    style: kTempTextStyle,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    '${condition}',
                    style: kConditionTextStyle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    '$weatherMessage in $cityName',
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
