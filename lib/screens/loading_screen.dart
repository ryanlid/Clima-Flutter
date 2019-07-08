import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:clima/services/location.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(locationWeather: weatherData);
      }),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }


  @override
  Widget build(BuildContext context) {
    print('build call');
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
