import 'dart:convert';

import 'package:bloc_trial/weather_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherEvent {
  final String city;

  WeatherEvent({required this.city});
}

class WeatherState {
  final String city;
  final double temperature;

  WeatherState({required this.city, required this.temperature});
}

class InitialWeatherState extends WeatherState {
  InitialWeatherState() : super(city: '', temperature: 0);
}

class WeatherLoadingState extends WeatherState {
  WeatherLoadingState() : super(city: '', temperature: 0);
}

class WeatherLoadedState extends WeatherState {
  WeatherLoadedState({required String city, required double temperature})
      : super(city: city, temperature: temperature);
}

class WeatherErrorState extends WeatherState {
  WeatherErrorState() : super(city: '', temperature: 0);
}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherState(city: '', temperature: 0)) {
    on<WeatherEvent>(getWeather);
  }
  void getWeather(WeatherEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());
    final response = await WeatherRepo().getWeather(city: event.city);
    if(response.statusCode == 200) {
      final resposeBody = jsonDecode(response.body);
      final temperature = resposeBody['main']['temp'];
      emit(WeatherLoadedState(city: event.city, temperature: temperature ));
    } else {
      emit(WeatherErrorState());
    }
  }
}
