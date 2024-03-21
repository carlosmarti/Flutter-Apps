import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/service/riverpodservice.dart';
import 'package:weather/weather_cards/weathercards.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:logger/logger.dart';

class HomePage extends ConsumerStatefulWidget {
  HomePage({super.key, required this.title});

  final String title;

  final List<WeatherCard> weatherCards = [];
  final logger = Logger();

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  @override
  Widget build(BuildContext context) {
    var weatherCardsProvider = ref.watch(getWeatherCardsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Swiper(
        itemBuilder: (context, index) {
          return weatherCardsProvider[index];
        },
        itemCount: weatherCardsProvider.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.logger.i("Adding a weather card to provider");
          setState(() {
           weatherCardsProvider.add(const WeatherCard(cityName: "Summerville"));
          });
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomAppBar(
        height: 40,
        padding: EdgeInsets.all(10.0),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
