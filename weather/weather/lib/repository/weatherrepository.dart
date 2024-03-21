import 'dart:convert';

import 'package:weather/modal/weather.dart';
import 'package:http/http.dart' as http;

class WeatherRepository{

  //members
  final key = "bf11f76e21c04033aa604854241403";
  String long = '-80.175652';
  String lat = '33.018505';

  //setter and getter
  String get longitude => "$long";
  String get latitude => "$lat";

  //Methods
  Future<Weather> getWeather(String cityName) async{

    String siteDomain = "http://api.weatherapi.com/v1/current.json?key=$key&q=$cityName&aqi=no";

    //add steps to retrive data from http and city
    var url = Uri.parse(siteDomain);
    var response = await http.post(url);

    final decoded = jsonDecode(response.body);
    //print("Response Status code: $weather");
    //print("Response Body: ${response.body}");
    
    return Weather.fromJson(decoded);
  }
}