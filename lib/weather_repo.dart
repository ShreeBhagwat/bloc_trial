import 'package:http/http.dart';

const String apiKey = "c6ffee661d487dae28b7f3244285f579";

class WeatherRepo {
  Future<Response> getWeather({required String city}) async {
    return await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey'));
  }
}
