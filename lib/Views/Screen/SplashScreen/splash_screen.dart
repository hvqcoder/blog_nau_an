import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pilot_app/ViewModels/home_view_model.dart';
import 'package:pilot_app/Views/Screen/HomeScreen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen(HomeViewModel())));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: Image.asset(
              'assets/background/background.png',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: size.width,
            height: size.height,
            child: Image.asset(
              'assets/images/splash_image.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          Image.asset(
            'assets/images/foody.png',
            height: 106,
            width: 219,
          ),
        ],
      ),
    );
  }
}
