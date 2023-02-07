class Weather {
  var cityName;
  var icon;
  var condition;
  var temp;
  var wind;
  var humidity;
  var wind_dir;
  var gust;
  var uv;
  var pressure;
  var precipe;
  var last_update;

  Weather({
    required this.cityName,
    required this.icon,
    required this.condition,
    required this.temp,
    required this.wind,
    required this.humidity,
    required this.wind_dir,
    required this.gust,
    required this.uv,
    required this.pressure,
    required this.precipe,
    required this.last_update,
  });

  Weather.fromJson(Map<String, dynamic>json){
    cityName=json['location']['name'];
    condition=json['current']['condition']['text'];
    wind=json['current']['wind_kph'];
    humidity=json['main']['humidity'];
    pressure=json['main']['pressure_mb'];
    icon=json['current']['condition']['icon'];
    temp=json['main']['temp_c'];
    wind_dir=json['current']['wind_dir'];
    precipe=json['current']['precipe_mm'];
    last_update=json['current']['last_update'];
    gust=json['current']['gust_kph'];
    uv=json['current']['uv'];
  }
}
