import 'dart:ffi';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Card(
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "100.0f",
                        style: TextStyle(fontSize: 35),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Icon(
                        Icons.cloud,
                        size: 90,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Rain",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Wheather forecast",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Card(
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "09:00",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                              width: 120,
                            ),
                            Icon(Icons.cloud),
                            SizedBox(
                              height: 20,
                            ),
                            Text("301.65 f"),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Card(
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "11:00",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                              width: 120,
                            ),
                            Icon(Icons.cloud),
                            SizedBox(
                              height: 20,
                            ),
                            Text("303.55 f"),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Card(
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "13:00",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                              width: 120,
                            ),
                            Icon(Icons.cloud),
                            SizedBox(
                              height: 20,
                            ),
                            Text("302.61 f"),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Addtional Information",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: const Column(
                      children: [
                        Icon(Icons.water_drop),
                        SizedBox(
                          height: 15,
                        ),
                        Text("humidity"),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "94",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: const Column(
                      children: [
                        Icon(Icons.air),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Wind Speed"),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "7.02",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: const Column(
                      children: [
                        Icon(Icons.beach_access_sharp),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Pressure"),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "1006",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
