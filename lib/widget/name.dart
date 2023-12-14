import 'package:flutter/material.dart';

class SayMyName extends StatelessWidget {
  const SayMyName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 30),
      child: Text(
        'HeBa HuSsEiN',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.end,
      ),
    );
  }
}