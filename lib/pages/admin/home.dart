import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penyiraman_jambu_iot/controllers/HomeController.dart';
import 'package:penyiraman_jambu_iot/pages/admin/dashboard.dart';
import 'package:penyiraman_jambu_iot/pages/admin/data_log.dart';
import 'package:penyiraman_jambu_iot/pages/admin/profil.dart';

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
            label: 'Data Log',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
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
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(0, 95, 0, 95),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/bg_dashboard.png'),
                        fit: BoxFit.cover),
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
                ),
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

  Widget content() {
    switch (XselectedIndex) {
      case 0:
        return Dashboard(emailUser: widget.emailUser);
      case 1:
        return const DataLog();
      case 2:
        return const Profil();
      default:
        return Dashboard(emailUser: widget.emailUser);
    }
  }

  Widget panelTitle() {
    switch (XselectedIndex) {
      case 0:
        return Text("Dashboard", style: TextStyle(fontSize: 25));
      case 1:
        return Text("Data Log", style: TextStyle(fontSize: 25));
      case 2:
        return Text("Profil", style: TextStyle(fontSize: 25));
      default:
        return Text("Dashboard", style: TextStyle(fontSize: 25));
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
        return Icon(Icons.person,
            size: 30, color: Color.fromARGB(255, 221, 235, 255));
      default:
        return Icon(Icons.dashboard,
            size: 30, color: Color.fromARGB(255, 221, 235, 255));
    }
  }
}
