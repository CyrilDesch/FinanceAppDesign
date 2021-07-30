import 'package:flutter/material.dart';
import 'package:testapp/utilities/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,
      body: Center(
        child: Text("Tu suces ?"),
      ),
    );
  }
}
