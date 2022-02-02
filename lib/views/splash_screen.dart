import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/views/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    toHomePage();
  }

  toHomePage() {
    Timer(Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "News App",
              style: GoogleFonts.playfairDisplay(
                  textStyle: const TextStyle(
                color: Colors.black87,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              )),
            ),
            Text(
              "Built by Needtechnosoft",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }
}
