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
        const Duration(
          milliseconds: 2500,
        ), () {
      Get.off(
        MyHome(emailUser: widget.emailInput),
      );
    });
    super.initState();
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
                  'assets/logo-apps.png',
                  width: 128,
                  height: 128,
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
