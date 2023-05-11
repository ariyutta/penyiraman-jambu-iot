// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penyiraman_jambu_iot/pages/auth/login.dart';

class SplashLogout extends StatefulWidget {
  const SplashLogout({super.key});

  @override
  State<SplashLogout> createState() => _SplashLogoutState();
}

class _SplashLogoutState extends State<SplashLogout> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(
        milliseconds: 1500,
      ),
      () {
        Get.offAll(
          LoginPages(),
          transition: Transition.fadeIn,
          duration: Duration(milliseconds: 1500),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
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
              margin: const EdgeInsets.only(top: 50),
              child: const CircularProgressIndicator(
                color: Color.fromARGB(255, 10, 85, 126),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
