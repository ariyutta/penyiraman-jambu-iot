// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DataLog extends StatefulWidget {
  const DataLog({super.key});

  @override
  State<DataLog> createState() => _DataLogState();
}

class _DataLogState extends State<DataLog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 230, 10, 10),
      child: Card(
        elevation: 5,
        child: ListView.separated(
          itemCount: 16,
          itemBuilder: (context, int index) {
            return ListTile(
              leading: const Icon(
                Icons.list,
                size: 50,
              ),
              title: Text("Area Kebun $index"),
              subtitle: Text('12 Febuari 2023'),
              trailing: Text('09:34 WIB'),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ),
      ),
    );
  }
}
