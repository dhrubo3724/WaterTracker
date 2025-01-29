import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const water_tracker());
}

class water_tracker extends StatelessWidget {
  const water_tracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home_screen(),
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        backgroundColor: Colors.green,
      )),
    );
  }
}
