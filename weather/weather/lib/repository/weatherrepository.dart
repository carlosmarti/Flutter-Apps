import 'package:weather/modal/city.dart';
import 'package:weather/modal/weather.dart';
import 'package:http/http.dart' as http;

class WeatherRepository{

  //members
  final key = "bea90cfd65c308559cb41916396ebf5d";
  String long = '-80.175652';
  String lat = '33.018505';

  //setter and getter
  String get longitude => "$long";
  String get latitude => "$lat";

  //Methods
  Future<Weather> getWeather(String cityName, String stateCode) async{

    String siteDomain = "http://api.weatherapi.com/v1/current.json?key=bf11f76e21c04033aa604854241403&q=$cityName&aqi=no";

    //add steps to retrive data from http and city
    var url = Uri.parse(siteDomain);
    var response = await http.post(url);

    print("Response Status code: ${response.statusCode}");
    print("Response Body: ${response.body}");
    
    return Weather();
  }

  Future<void> getCityLongLat(String city, String stateCode) async{
    String lim = '1';
    String geoURL = 'api.openweathermap.org';//"http://api.openweathermap.org/geo/1.0/direct?q=$city,$stateCode,US&limit=$lim&appid=$key";
    

    //add steps to retrive data through http

    var url = Uri.http(geoURL, '/geo/1.0/direct?q=$city,$stateCode&appid=bea90cfd65c308559cb41916396ebf5d');
    var response = await http.post(url);

    print("Response Status code: ${response.statusCode}");
    print("Response Body: ${response.body}");
    
    //return City();
  }
}