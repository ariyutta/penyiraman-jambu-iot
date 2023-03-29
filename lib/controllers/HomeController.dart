import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var ctime;

  onBackButtonDoubleClicked(BuildContext context) {
    DateTime now = DateTime.now();
    if (ctime == null || now.difference(ctime) > const Duration(seconds: 2)) {
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
            'Logout',
          ),
          content: const Text(
            'Apakah anda ingin logout?',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const SplashLogout(),
                //     ),
                //     (route) => false);
              },
              child: const Text(
                'Ya',
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text(
                'Tidak',
              ),
            )
          ],
        );
      },
    );
  }
}
