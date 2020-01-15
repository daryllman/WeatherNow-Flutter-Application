import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  NetworkHelper(this.url);

  final String url;

  Future<void> getData() async {
    //http.Response response = await http.get('http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    http.Response response = await http.get('http://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
    //http.Response response = await http.get('http://sample.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=b6907d289e10d714a6e88b30761fae22');
    if (response.statusCode == 200){
      String data = response.body;

      var decodedData = jsonDecode(data);

      return decodedData;

    } else{
      print(response.body);
    }
  }


}