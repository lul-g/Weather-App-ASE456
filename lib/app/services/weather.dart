import 'location.dart';
import 'networking.dart';

const apiKey = 'c8816ba7bf255bcb06664ac735cac0ec';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

//https://api.openweathermap.org/data/2.5/weather';
// '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric'
class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var str = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    Uri uri = Uri.parse(str);
    print(str);
    NetworkHelper networkHelper = NetworkHelper(uri);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    await location.getCurrentLocation();

    Uri uri = Uri.parse(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    NetworkHelper networkHelper = NetworkHelper(uri);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
