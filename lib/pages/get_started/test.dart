// ignore_for_file: avoid_unnecessary_containers

import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:penyiraman_jambu_iot/pages/get_started/index.dart';

class Halaman extends StatefulWidget {
  const Halaman({super.key});

  @override
  State<Halaman> createState() => _HalamanState();
}

class _HalamanState extends State<Halaman> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FlutterSplashScreen.fadeIn(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
            ],
          ),
          childWidget: SizedBox(
            height: 150,
            width: 150,
            child: Image.asset("assets/logo-apps-circle.png"),
          ),
          defaultNextScreen: const GetStarted(),
        ),
      ),
    );
  }
}
