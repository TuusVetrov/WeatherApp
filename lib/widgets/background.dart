import 'package:flutter/material.dart';

class BackgroundView extends StatelessWidget {
  const BackgroundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.blue,
          Colors.red,
        ],
      )),
    );
  }
}
