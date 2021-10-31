import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      title: 'Wether',
      home: LocationScreen(),
    );
  }
}
