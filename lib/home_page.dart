import 'package:appmeteo/weatherData.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'weather_Model.dart';
import 'weatherData.dart';
import 'getlocation.dart';

class MyHomePage extends StatelessWidget {
  //const MyHomePage({Key? key}) : super(key: key);
  var client= WeatherData();
  var data;

  MyHomePage({super.key,});
  info() async{
    var position= await GetPosition();
    data= await client.getData("14.6937", "-17.4441");
    return data;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: FutureBuilder(
        future: info(),
        builder: ((context, snapshot){
          return Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(right: 5, left: 5),
                  height: 550,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(
                          colors: [
                            Colors.deepPurple,
                            Colors.blue,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.topRight,
                          stops: [0.2, 0.99]
                      )
                  ),
                  child: Column(
                    children: [
                      Text(
                        "${data?.cityName}",
                        style: GoogleFonts.raleway(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Mercredi, 25 Janvier ',
                        style:GoogleFonts.raleway( color: Colors.white,fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Image.asset('assets/images/soleil.png',
                        height:150,
                        width:150,
                      ),
                      Text('${data?.condition}',
                          style: GoogleFonts.robotoMono(color: Colors.white,
                              fontSize: 29,
                              fontWeight: FontWeight.w800)
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('${data?.temp}',
                        style: GoogleFonts.robotoMono( color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset('assets/images/storm.png',
                                  height:60,
                                  width: 60,
                                ),
                                Text('${data?.wind}km/h',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text('wind',
                                  style: TextStyle(color: Colors.white),
                                ),

                              ],
                            ),

                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset('assets/images/humidite.webp',
                                  height: 60,
                                  width: 60,
                                  color: Colors.white,
                                ),
                                Text('${data?.humidity}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text('Humidity',
                                  style: TextStyle(color: Colors.white),
                                ),

                              ],
                            ),

                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset('assets/images/direction.png',
                                  height: 60,
                                  width: 60,
                                  color: Colors.white,
                                ),
                                Text('${data?.wind_dir}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text('wind direction',
                                  style: TextStyle(color: Colors.white),
                                ),

                              ],
                            ),

                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                          children: [
                            Text('Guest',style: TextStyle(color: Colors.white24),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('${data?.gust}kp/h',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )
                    ),
                    Expanded(
                        child: Column(
                          children: [
                            Text('UV',
                              style: TextStyle(color: Colors.white24),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('${data?.uv} kp/h',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )
                    ),
                    Expanded(
                        child: Column(
                          children: [
                            Text('Wind',
                              style: TextStyle(color: Colors.white24),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('${data?.wind} km/h',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                          children: [
                            Text('Pressure',style: TextStyle(color: Colors.white24),
                            ),
                            Text('${data?.pressure} hpa',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )
                    ),
                    Expanded(
                        child: Column(
                          children: [
                            Text('Precipitation',style: TextStyle(color: Colors.white24),
                            ),
                            Text('${data?.precipe} mm',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )
                    ),
                    Expanded(
                        child: Column(
                          children: [
                            Text('Last update',style: TextStyle(color: Colors.white24),
                            ),
                            Text('${data?.last_update}',
                              style: TextStyle(color: Colors.lightGreen,),
                            ),
                          ],
                        )
                    ),
                  ],
                )
              ],
            ),
          );
      }),)
    );
  }
}