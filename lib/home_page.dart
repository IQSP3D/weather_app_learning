import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/addtional_information.dart';
import 'package:weather_app/every_two_hour_widget_card.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;

import '.secert.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  double temp = 0;
  double humidity = 0;
  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future getCurrentWeather() async {
    String city = 'London';
    try {
      final request = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$city&APPID=$apikey',
        ),
      );
      if (request.statusCode != 200) {
        throw "error there is something wrong ";
      }
      final apidata = jsonDecode(request.body);
      setState(() {
        temp = apidata["list"][0]['main']['temp'];
        // humidity = double.parse(apidata["list"][0]['main']['humidity']);
        isLoading = false;
      });
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
            IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
          ],
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
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
                                  "$temp k",
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
                                const Text(
                                  "Rain",
                                  style: TextStyle(fontSize: 20),
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
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                EveryTwoHourUpdate(
                                  time: DateTime.now(),
                                  icon: Icons.abc_outlined,
                                  temperature: 5.5,
                                ),
                                EveryTwoHourUpdate(
                                  time: DateTime.now(),
                                  icon: Icons.abc_outlined,
                                  temperature: 5.5,
                                ),
                                EveryTwoHourUpdate(
                                  time: DateTime.now(),
                                  icon: Icons.abc_outlined,
                                  temperature: 5.5,
                                ),
                                EveryTwoHourUpdate(
                                  time: DateTime.now(),
                                  icon: Icons.abc_outlined,
                                  temperature: 5.5,
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
              ));
  }
}
