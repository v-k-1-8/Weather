import 'package:flutter/material.dart';
import 'package:weather/style.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/citybg.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 50.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: kTextFieldInputDecoration,
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  child: Text(
                    'Get Weather',
                    style: kButtonTextStyle,
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
