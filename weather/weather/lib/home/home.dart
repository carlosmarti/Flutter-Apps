import 'package:flutter/material.dart';
import 'package:weather/weather_cards/weathercards.dart';
import 'package:card_swiper/card_swiper.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<WeatherCard> weatherCards = [WeatherCard(cityName: "", stateCode: "",), WeatherCard(cityName: "Houston", stateCode: "TX",)];

  //call back function to update and add a new weathercard
  void addWeatherCard(){

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Swiper(
        itemBuilder: (context, index) {
          return weatherCards[index];
        },
        itemCount: weatherCards.length,
      ),
    );
  }
}