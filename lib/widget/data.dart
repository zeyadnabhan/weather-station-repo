import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SensorData extends StatelessWidget {
  String title;
  String valueString;

  SensorData({super.key, required this.title, required this.valueString});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 20),
                child: Text(
                  '$title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 130),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('$valueString'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
