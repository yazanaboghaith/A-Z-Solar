import 'package:az_solar/Splash/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const az_solar());
}

class az_solar extends StatelessWidget {
  const az_solar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
