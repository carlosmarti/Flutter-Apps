import 'package:weather/modal/city.dart';
import 'package:weather/modal/weather.dart';

class WeatherRepository{

  //members
  final key = "bea90cfd65c308559cb41916396ebf5d";
  String? long;
  String? lat;

  //setter and getter
  String get longitude => "$long";
  String get latitude => "$lat";

  //Methods
  Weather getWeather(String cityName){

    String url = "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$long&exclude={part}&appid=$key";
    

    //add steps to retrive data from http and city
    
    return Weather();
  }

  City getCityLongLat(String city){
    String lim = '1';
    String geoURL = "http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=$lim&appid=$key";
    

    //add steps to retrive data through http

    return City();
  }
}