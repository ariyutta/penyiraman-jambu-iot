import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penyiraman_jambu_iot/pages/templates/loading_login.dart';

class LoginController extends GetxController {
  String emailInput = '';
  String passInput = '';

  final formKey = GlobalKey<FormState>();

  bool cekInput() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return null!;
  }

  void prosesLogin() async {
    try {
      if (cekInput()) {
        final user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: emailInput, password: passInput);
        Get.off(
          SplashLogin(
            emailInput: emailInput,
            passInput: passInput,
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> onBackButtonPressed(BuildContext context) async {
    bool exitApp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Keluar',
          ),
          content: const Text(
            'Anda ingin menutup aplikasi ini?',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
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
                'Batal',
              ),
            )
          ],
        );
      },
    );
    return exitApp;
  }
}
