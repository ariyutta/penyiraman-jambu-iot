import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penyiraman_jambu_iot/pages/auth/login.dart';
import 'package:penyiraman_jambu_iot/pages/get_started/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const GetMaterialApp(
      title: 'Pondok Paman Petani',
      home: GetStarted(),
    ),
  );
}

class GetMaterialApps extends StatelessWidget {
  const GetMaterialApps({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const LoginPages()),
      ],
    );
  }
}
