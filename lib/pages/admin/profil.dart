// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Ini Halaman Profil'),
    );
  }
}
