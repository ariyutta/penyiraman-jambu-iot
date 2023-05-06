// ignore_for_file: file_names, prefer_typing_uninitialized_variables, prefer_const_constructors, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penyiraman_jambu_iot/pages/templates/loading_logout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var ctime;

  onBackButtonDoubleClicked(BuildContext context) {
    DateTime now = DateTime.now();
    if (ctime == null || now.difference(ctime) > Duration(seconds: 2)) {
      //add duration of press gap
      ctime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(65.0),
          content: Center(
            child: Text(
              'Klik lagi untuk menutup aplikasi',
            ),
          ),
        ),
      ); //scaffold message, you can show Toast message too.
      return Future.value(false);
    }
    // return Future.value(true);
    return prosesLogout(context);
  }

  prosesLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Log Out',
          ),
          content: Text(
            'Apakah anda ingin logout?',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut().then((value) async {
                  SharedPreferences removeSession =
                      await SharedPreferences.getInstance();
                  await removeSession.remove('email');
                  await removeSession.remove('password');
                  Get.off(SplashLogout());
                });
              },
              child: Text(
                'Ya',
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                'Tidak',
              ),
            )
          ],
        );
      },
    );
  }
}
