// ignore_for_file: null_check_always_fails, unused_local_variable, file_names, avoid_print, prefer_const_constructors, unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penyiraman_jambu_iot/pages/templates/loading_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        SharedPreferences saveLogin = await SharedPreferences.getInstance();
        final user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: emailInput, password: passInput);
        saveLogin.setString("email", emailInput);
        saveLogin.setString("password", passInput);
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
          content: Text(
            'Anda ingin menutup aplikasi ini?',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
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
