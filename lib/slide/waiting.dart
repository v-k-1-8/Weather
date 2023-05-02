import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/backservice/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/backservice/weather_finder.dart';
import 'screen_location.dart';
import 'city_screen.dart';

var latitude;
var longitude;
var weatherData;

class Front extends StatefulWidget {
  const Front({Key? key}) : super(key: key);

  @override
  State<Front> createState() => _FrontState();
}

class _FrontState extends State<Front> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: scaff(),
    );
  }
}

class scaff extends StatefulWidget {
  const scaff({Key? key}) : super(key: key);

  @override
  State<scaff> createState() => _scaffState();
}

class _scaffState extends State<scaff> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    weatherData = await Weather().getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(weatherData);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Checking for locaion access',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.end,
                )),
          ),
          Expanded(
            flex: 8,
            child: Align(
              alignment: Alignment.topCenter,
              child: SpinKitChasingDots(
                color: Colors.tealAccent,
                size: 150,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
