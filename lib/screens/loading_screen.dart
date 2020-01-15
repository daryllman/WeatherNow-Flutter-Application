import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';


const apiKey = '27c2d1193a2a5127a56a58b576645182';

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
    getLocationData(); //initialise locationGetter here as initState only runs once.

  }

  void getLocationData() async{
    Location location = Location();
    await location.getCurrentLocation(); //we can only await this method if that method returns a future
    longitude = location.longitude;
    latitude = location.latitude;

    NetworkHelper networkHelper = NetworkHelper('http://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');

    var weatherData = await networkHelper.getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}



