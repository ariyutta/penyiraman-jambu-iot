// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, non_constant_identifier_names, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penyiraman_jambu_iot/controllers/HomeController.dart';
import 'package:penyiraman_jambu_iot/pages/admin/aktivitas_log.dart';
import 'package:penyiraman_jambu_iot/pages/admin/dashboard.dart';
import 'package:penyiraman_jambu_iot/pages/admin/pengaturan.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key, required this.emailUser});

  final String emailUser;

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int XselectedIndex = 0;

  HomeController homes = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 235, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 85, 126),
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: panelIcon(),
            ),
            panelTitle()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 10, 85, 126),
        unselectedItemColor: Color.fromARGB(255, 156, 166, 180),
        selectedItemColor: Colors.white,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            label: 'Aktivitas Log',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
        currentIndex: XselectedIndex,
        onTap: (value) {
          setState(() {
            XselectedIndex = value;
          });
        },
      ),
      // body: content(),
      body: WillPopScope(
        onWillPop: () => homes.onBackButtonDoubleClicked(context),
        child: Stack(
          children: [
            Column(
              children: [
                background(),
              ],
            ),
            Positioned(
              child: content(),
            ),
          ],
        ),
      ),
    );
  }

  Widget background() {
    switch (XselectedIndex) {
      case 0:
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(0, 85, 0, 85),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg_dashboard.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            children: [
              const Text(
                'Selamat Datang,',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 164, 255, 98),
                ),
              ),
              Text(
                '${widget.emailUser}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );

      case 1:
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(0, 85, 0, 85),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg_log.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            children: [
              const Text(
                'Selamat Datang,',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 164, 255, 98),
                ),
              ),
              Text(
                '${widget.emailUser}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      case 2:
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(0, 85, 0, 85),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg_dashboard.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            children: [
              Text(
                '',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 164, 255, 98),
                ),
              ),
              Text(
                '',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      default:
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(0, 85, 0, 85),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg_dashboard.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            children: [
              const Text(
                'Selamat Datang,',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 164, 255, 98),
                ),
              ),
              Text(
                '${widget.emailUser}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
    }
  }

  Widget content() {
    switch (XselectedIndex) {
      case 0:
        return Dashboard(emailUser: widget.emailUser);
      case 1:
        return const DataLog();
      case 2:
        return const Pengaturan();
      default:
        return Dashboard(emailUser: widget.emailUser);
    }
  }

  Widget panelTitle() {
    switch (XselectedIndex) {
      case 0:
        return Text("Dashboard", style: TextStyle(fontSize: 21));
      case 1:
        return Text("Aktivitas Log", style: TextStyle(fontSize: 21));
      case 2:
        return Text("Pengaturan", style: TextStyle(fontSize: 21));
      default:
        return Text("Dashboard", style: TextStyle(fontSize: 21));
    }
  }

  Widget panelIcon() {
    switch (XselectedIndex) {
      case 0:
        return Icon(Icons.dashboard,
            size: 30, color: Color.fromARGB(255, 221, 235, 255));
      case 1:
        return Icon(Icons.event_note,
            size: 30, color: Color.fromARGB(255, 221, 235, 255));
      case 2:
        return Icon(Icons.settings,
            size: 30, color: Color.fromARGB(255, 221, 235, 255));
      default:
        return Icon(Icons.dashboard,
            size: 30, color: Color.fromARGB(255, 221, 235, 255));
    }
  }

  Widget panelGambar() {
    switch (XselectedIndex) {
      case 0:
        return Icon(Icons.dashboard,
            size: 30, color: Color.fromARGB(255, 221, 235, 255));
      case 1:
        return Icon(Icons.event_note,
            size: 30, color: Color.fromARGB(255, 221, 235, 255));
      case 2:
        return Icon(Icons.person,
            size: 30, color: Color.fromARGB(255, 221, 235, 255));
      default:
        return Icon(Icons.dashboard,
            size: 30, color: Color.fromARGB(255, 221, 235, 255));
    }
  }
}
