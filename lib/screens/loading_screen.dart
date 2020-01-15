import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    getLocation(); //initialise locationGetter here as initState only runs once.

  }

  void getLocation() async{
    Location location = Location();
    await location.getCurrentLocation(); //we can only await this method if that method returns a future
    longitude = location.longitude;
    latitude = location.latitude;
  }
  
  void getData() async {
    //http.Response response = await http.get('http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    http.Response response = await http.get('http://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
    //http.Response response = await http.get('http://sample.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=b6907d289e10d714a6e88b30761fae22');
    if (response.statusCode == 200){
      String data = response.body;

      var decodedData = jsonDecode(data);

      double temperature = decodedData['main']['temp'];
      int condition = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];
      print(temperature);
      print(condition);
      print(cityName);

    } else{
      print(response.body);
    }

  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}



