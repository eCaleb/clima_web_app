import 'package:clima_web_app/screens/location_screen.dart';
import 'package:clima_web_app/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _getLocationAndData();
  }

  Future<void> _getLocationAndData() async {
    try {
      WeatherModel weatherModel = WeatherModel();
      var weatherData = await weatherModel.getLocationWeather();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LocationScreen(
              locationWeather: weatherData,
            ),
          ),
        );
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
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
