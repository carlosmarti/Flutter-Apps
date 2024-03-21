import 'package:weather/modal/weather.dart';
import 'package:weather/repository/weatherrepository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather/weather_cards/weathercards.dart';

part 'riverpodservice.g.dart';



@riverpod
WeatherRepository weatherRepository(WeatherRepositoryRef ref){

  return WeatherRepository();
}

@riverpod
Future<Weather> weatherFuture(WeatherFutureRef ref, String cityName) async{

  final weatherRepository = ref.watch(weatherRepositoryProvider);

  return await weatherRepository.getWeather(cityName);
}

@riverpod
List<WeatherCard> getWeatherCards(GetWeatherCardsRef ref) => <WeatherCard>[];