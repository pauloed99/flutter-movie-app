import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Modular.to.pushReplacementNamed('/home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/splash_image.jpg',
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
          Center(
            child: Text(
              'Movies App',
              style: TextStyle(color: Colors.white, fontSize: width * .14),
            ),
          )
        ],
      ),
    );
  }
}
