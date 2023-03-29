import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penyiraman_jambu_iot/controllers/LoginController.dart';

class LoginPages extends StatefulWidget {
  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  LoginController login = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 235, 255),
      body: WillPopScope(
        onWillPop: () => login.onBackButtonPressed(context),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(120.0),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 10, 85, 126),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                    ),
                  ),
                ),
              ],
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 680, 0, 0),
                child: Text(
                  'Build Version : 1.0.0',
                ),
              ),
            ),
            Center(
              child: Form(
                key: login.formKey,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/logo-apps.png',
                                    width: 200,
                                    height: 200,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                  child: Text(
                                    'Sistem Pemantauan dan Kendali Penyiraman Berbasis IoT',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Username",
                                      hintText: "Contoh : example@gmail.com",
                                      prefixIcon: const Icon(Icons.person),
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          20.0, 10.0, 20.0, 10.0),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                      ),
                                    ),
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Email tidak boleh kosong!';
                                      }
                                      return null;
                                    },
                                    onSaved: (String? value) {
                                      login.emailInput = value!;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                      prefixIcon: const Icon(Icons.lock),
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          20.0, 10.0, 20.0, 10.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0)),
                                    ),
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Password tidak boleh kosong!';
                                      }
                                      return null;
                                    },
                                    onSaved: (String? value) {
                                      login.passInput = value!;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 20, 8, 20),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 10, 85, 126),
                                        foregroundColor: Colors.white,
                                        // elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        login.prosesLogin();
                                      },
                                      child: Column(
                                        children: const [
                                          Text(
                                            'LOGIN',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
