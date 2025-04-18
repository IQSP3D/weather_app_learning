import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/addtional_information.dart';
import 'package:weather_app/every_two_hour_widget_card.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
import '.secert.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Map> weather;
  @override
  void initState() {
    super.initState();
    weather = getCurrentWeather();
  }

  Future<Map> getCurrentWeather() async {
    String city = 'karbala';
    try {
      final request = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$city&APPID=$apikey',
        ),
      );
      if (request.statusCode != 200) {
        throw "error there is something wrong ";
      }
      return jsonDecode(request.body);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Weather App"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    weather = getCurrentWeather();
                  });
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: FutureBuilder(
            future: weather,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Sorry Error Something Went Wrong \n ${snapshot.error.toString()} ",
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              } else {
                final data = snapshot.data!;
                final currentTempat = data['list'][0]['main']['temp'];
                final futureWeather = snapshot.data['list'];
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text(
                                    '$currentTempat k',
                                    style: const TextStyle(fontSize: 35),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Icon(
                                    Icons.cloud,
                                    size: 90,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    futureWeather[0]['weather'][0]['main'],
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Wheather forecast",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context).copyWith(
                              dragDevices: {
                                PointerDeviceKind.mouse,
                                PointerDeviceKind.touch,
                              },
                            ),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: futureWeather.length,
                              itemBuilder: (BuildContext context, int i) {
                                final time = DateFormat.j().format(
                                    DateTime.parse(futureWeather[i]['dt_txt']));
                                return EveryTwoHourUpdate(
                                    time: time,
                                    temperature: futureWeather[i]['main']
                                            ['temp']
                                        .toString(),
                                    icon: futureWeather[i]['weather'][0]
                                                    ['main'] ==
                                                'Clouds' ||
                                            futureWeather[i]['weather'][0]
                                                    ['main'] ==
                                                'Rains'
                                        ? Icons.water_drop_rounded
                                        : Icons.sunny);
                              },
                            ),
                          ),
                          // ScrollConfiguration(
                          //   behavior: ScrollConfiguration.of(context).copyWith(
                          //     dragDevices: {
                          //       PointerDeviceKind.mouse,
                          //       PointerDeviceKind.touch,
                          //     },
                          //   ),
                          //   child:

                          //   SingleChildScrollView(
                          //     scrollDirection: Axis.horizontal,
                          //     child: Row(
                          //       // mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         for (int i = 1; i < futureWeather.length; i++)
                          //           EveryTwoHourUpdate(
                          //
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Addtional Information",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AddtionalInformation(
                              icon: Icons.air,
                              value: 24.3,
                              label: "Wind Speed",
                            ),
                            AddtionalInformation(
                              icon: Icons.beach_access,
                              value: 194.3,
                              label: "humidity",
                            ),
                            AddtionalInformation(
                              icon: Icons.water_drop_rounded,
                              value: 93.3,
                              label: "Pressure",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
            }));
  }
}
