import 'dart:async';

import 'package:flutter/material.dart';
import 'package:route_nuews23/views/home_view.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeView()),
            ));
    return Container(
      color: Colors.white,
      child: Center(
        child: Container(
            width: 90,
            height: 90,
            child: Image.asset("assets/img/news_logo.png")),
      ),
    );
  }
}
