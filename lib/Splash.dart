import 'dart:async';

import 'package:bun_wa_hal/auth/Singup.dart';
import 'package:bun_wa_hal/auth/chose.dart';
import 'package:bun_wa_hal/main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

String email;
String password;
String phone;

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    getValiducation().whenComplete(() async {
      Timer(
          Duration(
            seconds: 4,
          ), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => phone == null ? chose() : MyApp()));
      });
    });
  }

  Future getValiducation() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainEmail = sharedPreferences.getString('email');
    var obtainPassword = sharedPreferences.getString('password');
    var obtainPhone = sharedPreferences.getString('phone');
    setState(() {
      email = obtainEmail;
      password = obtainPassword;
      phone = obtainPhone;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Lottie.asset('Images/desana', repeat: false),
          ],
        ),
      ),
    );
  }
}
