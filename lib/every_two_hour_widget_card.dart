import 'package:flutter/material.dart';

class EveryTwoHourUpdate extends StatelessWidget {
  final DateTime time;
  final double temperature;
  final IconData icon;
  const EveryTwoHourUpdate(
      {super.key,
      required this.time,
      required this.temperature,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                time.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
                width: 120,
              ),
              const Icon(Icons.cloud),
              const SizedBox(
                height: 20,
              ),
              const Text("301.65 k"),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
