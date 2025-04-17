import 'package:flutter/material.dart';

class AddtionalInformation extends StatelessWidget {
  final IconData icon;
  final String label;
  final double value;
  const AddtionalInformation(
      {super.key,
      required this.icon,
      required this.label,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Icon(icon),
          const SizedBox(
            height: 15,
          ),
          Text(label),
          const SizedBox(
            height: 15,
          ),
          Text(
            value.toStringAsFixed(2),
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
