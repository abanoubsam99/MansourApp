import 'package:flutter/material.dart';
import 'package:mansourapp/Color.dart';
import 'package:mansourapp/features/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'منصور',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(getColorHexFromStr("#A52B2C")),
          accentColor: Color(getColorHexFromStr("#F6F6F6")),
          fontFamily: 'Droid Arabic Kufi'
      ),
      home: SplashScreen(),
    );
  }
}
