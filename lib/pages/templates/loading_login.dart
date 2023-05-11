// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penyiraman_jambu_iot/pages/admin/home.dart';

// ignore: must_be_immutable
class SplashLogin extends StatefulWidget {
  String emailInput;
  String passInput;
  SplashLogin({super.key, required this.emailInput, required this.passInput});

  @override
  State<SplashLogin> createState() => _SplashLoginState();
}

class _SplashLoginState extends State<SplashLogin> {
  @override
  void initState() {
    Future.delayed(
      Duration(
        milliseconds: 1500,
      ),
      () {
        Get.offAll(
          MyHome(emailUser: widget.emailInput),
          transition: Transition.fadeIn,
          duration: Duration(milliseconds: 1500),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.white,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/logo-apps-circle.png',
                  width: 150,
                  height: 150,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 10, 85, 126),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
