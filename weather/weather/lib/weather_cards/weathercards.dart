import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/service/riverpodservice.dart';

class WeatherCard extends ConsumerWidget {
  const WeatherCard({
    super.key,
    required this.cityName,
    required this.stateCode,
  });

  final String cityName;
  final String stateCode;
  //final Function addWeatherCallBack;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: SizedBox(
          height: 300,
          width: 300,
          child: Builder(builder: (context) {
            if (cityName.isEmpty && stateCode.isEmpty) {
              return Column(
                children: [
                  //add input for user to add the city name and statecode with a callback to the parent function to update this weather card widget and add a new empty weathercard widget
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter City'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter State Code'),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          
                         ref.watch(weatherFutureProvider("SummerVille", "SC"));
                        },
                        child: const Text('Submit'),
                      )
                    ],
                  )
                ],
              );
            }

            return Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(cityName),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(stateCode),
              ),
            ]);
          })),
    );
  }
}
