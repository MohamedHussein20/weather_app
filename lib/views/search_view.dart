import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search a City',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.of(context).pop();
            },
            enabled: true,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
              hintText: 'Enter City Name',
              hintStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.green,
              )),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
