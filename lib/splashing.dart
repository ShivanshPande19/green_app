// it will have the code of the splash screen
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_snu/main.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2000),(){
      Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context)=>const MyHomePage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              left: 90.0,
              top: 150.0,
              child: Image.asset(
                'images/image1.png',
                height: 311,
                width: 253,),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Image.asset(
                  'images/bottom_image.png',
                  width: 430,
                  height: 328,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
