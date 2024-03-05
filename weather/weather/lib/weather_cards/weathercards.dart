import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherCard extends ConsumerWidget {
  const WeatherCard({super.key, required this.cityName});

  final String cityName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: SizedBox(
        height: 300,
        width: 300,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(cityName),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(""),
            ),
          ],
        ),
      ),
    );
  }
}