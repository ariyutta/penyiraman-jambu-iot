// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_local_variable, unrelated_type_equality_checks, must_be_immutable, prefer_const_constructors_in_immutables, avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penyiraman_jambu_iot/controllers/LoginController.dart';
import 'package:penyiraman_jambu_iot/pages/auth/login.dart';
import 'package:penyiraman_jambu_iot/pages/get_started/test.dart';
import 'package:penyiraman_jambu_iot/pages/templates/loading_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences saveLogin = await SharedPreferences.getInstance();

  await Firebase.initializeApp();
  LoginController login = Get.put(LoginController());

  runApp(
    GetMaterialApp(
      title: 'Pondok Paman Petani',
      home: await setLogin()
          ? SplashLogin(
              emailInput: saveLogin.getString('email') ?? '',
              passInput: saveLogin.getString('password') ?? '')
          : Halaman(),
    ),
  );
}

class GetMaterialApps extends StatelessWidget {
  GetMaterialApps({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPages()),
      ],
    );
  }
}

Future<bool> setLogin() async {
  SharedPreferences saveLogin = await SharedPreferences.getInstance();
  if (saveLogin.getString('email') != null &&
      saveLogin.getString('password') != null) {
    print('Program Jalan');
    print(saveLogin.getString('email'));
    print(saveLogin.getString('password'));
    return true;
  } else {
    print('Program Tidak Jalan');
    print(saveLogin.getString('email'));
    print(saveLogin.getString('password'));
    return false;
  }
}
