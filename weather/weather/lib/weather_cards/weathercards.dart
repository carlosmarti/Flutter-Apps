import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherCard extends ConsumerStatefulWidget {
   const WeatherCard({
    super.key,
    required this.cityName,
  });

   final String cityName;

  @override
  ConsumerState<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends ConsumerState<WeatherCard> {
@override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 300,
          width: 300,
          child:
            Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.cityName),
              ),
            ])
      ));

  }
}
