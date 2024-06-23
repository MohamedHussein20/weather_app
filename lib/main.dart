import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const CustomMaterialApp(),
    );
  }
}

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
            .weatherModel?.weatherCondition),
        appBarTheme: AppBarTheme(
            backgroundColor: getThemeColor(
                BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModel?.weatherCondition)),
      ),
      home: const HomeView(),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'sunny':
      return Colors.orange;
    case 'clear':
      return Colors.deepOrange;
    case 'partly cloudy':
      return Colors.lightBlue;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.grey;
    case 'mist':
      return Colors.lightBlue;
    case 'patchy rain possible':
      return Colors.lightBlue;
    case 'patchy snow possible':
      return Colors.cyan;
    case 'patchy sleet possible':
      return Colors.lightBlue;
    case 'patchy freezing drizzle possible':
      return Colors.grey;
    case 'thundery outbreaks possible':
      return Colors.deepPurple;
    case 'blowing snow':
      return Colors.lightBlue;
    case 'blizzard':
      return Colors.grey;
    case 'fog':
      return Colors.grey;
    case 'freezing fog':
      return Colors.lightBlue;
    case 'patchy light drizzle':
      return Colors.lightBlue;
    case 'light drizzle':
      return Colors.lightBlue;
    case 'freezing drizzle':
      return Colors.grey;
    case 'heavy freezing drizzle':
      return Colors.cyan;
    case 'patchy light rain':
      return Colors.lightBlue;
    case 'light rain':
      return Colors.blue;
    case 'moderate rain at times':
      return Colors.blue;
    case 'moderate rain':
      return Colors.blue;
    case 'heavy rain at times':
      return Colors.indigo;
    case 'heavy rain':
      return Colors.indigo;
    case 'light freezing rain':
      return Colors.grey;
    case 'moderate or heavy freezing rain':
      return Colors.cyan;
    case 'light sleet':
      return Colors.lightBlue;
    case 'moderate or heavy sleet':
      return Colors.blue;
    case 'patchy light snow':
      return Colors.lightBlue;
    case 'light snow':
      return Colors.lightBlue;
    case 'patchy moderate snow':
      return Colors.cyan;
    case 'moderate snow':
      return Colors.cyan;
    case 'patchy heavy snow':
      return Colors.lightBlue;
    case 'heavy snow':
      return Colors.blue;
    case 'ice pellets':
      return Colors.lightBlue;
    case 'light rain shower':
      return Colors.lightBlue;
    case 'moderate or heavy rain shower':
      return Colors.indigo;
    case 'torrential rain shower':
      return Colors.indigo;
    case 'light sleet showers':
      return Colors.lightBlue;
    case 'moderate or heavy sleet showers':
      return Colors.blue;
    case 'light snow showers':
      return Colors.lightBlue;
    case 'moderate or heavy snow showers':
      return Colors.blue;
    case 'light showers of ice pellets':
      return Colors.lightBlue;
    case 'moderate or heavy showers of ice pellets':
      return Colors.blue;
    case 'patchy light rain with thunder':
      return Colors.deepPurple;
    case 'moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'patchy light snow with thunder':
      return Colors.purple;
    case 'moderate or heavy snow with thunder':
      return Colors.purple;
    default:
      return Colors.blue;
  }
}
