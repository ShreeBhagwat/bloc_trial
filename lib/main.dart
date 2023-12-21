import 'package:bloc_trial/counter_bloc.dart';
import 'package:bloc_trial/counter_cubit.dart';
import 'package:bloc_trial/get_weather.dart';
import 'package:bloc_trial/weather_bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<CounterCubit>(
              create: (context) => CounterCubit(),
            ),
            BlocProvider<WeatherBloc>(create: (context) => WeatherBloc())
          ],
          child: GetWeather(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterCubit, int>(
                bloc: BlocProvider.of<CounterCubit>(context),
                builder: (context, state) {
                  return Text('$state',
                      style: Theme.of(context).textTheme.headlineMedium);
                }),
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () =>
                BlocProvider.of<CounterCubit>(context).increament(),
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () =>
                BlocProvider.of<CounterCubit>(context).decreament(),
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
