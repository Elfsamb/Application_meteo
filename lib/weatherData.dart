import 'dart:convert';
import 'package:appmeteo/weather_Model.dart';
import 'package:http/http.dart' as http;

class WeatherData{

  Future<Weather> getData (var latitude, var longitude) async{
    var uriCall= Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=24f94dc7a4a9b4e99d0855667dba3105');
    var response= await http.get(uriCall);
    var body=jsonDecode(response.body);
    print(Weather.fromJson(body));
    return Weather.fromJson(body);

  }

}