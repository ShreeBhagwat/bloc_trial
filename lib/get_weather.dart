import 'package:bloc_trial/weather_bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetWeather extends StatelessWidget {
  const GetWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<WeatherBloc>(context)
                      .add(WeatherEvent(city: 'Pune'));
                },
                child: Text('Get Weather')),
            BlocBuilder<WeatherBloc, WeatherState>(
                bloc: BlocProvider.of<WeatherBloc>(context),
                builder: (context, state) {
                  if (state is WeatherLoadingState) {
                    return CircularProgressIndicator();
                  } else if (state is WeatherLoadedState) {
                    return Text('${state.temperature}');
                  } else if (state is WeatherErrorState) {
                    return Text('Error');
                  } else {
                    return Text('Initial');
                  }
                })
          ],
        ),
      ),
    );
  }
}
