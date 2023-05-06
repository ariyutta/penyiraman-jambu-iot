// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
              // leading: Icon(
              //   Icons.list,
              //   size: 50,
              // ),
              title: Row(
                children: [
                  Icon(Icons.grass, size: 30, color: Colors.green),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text("Sampel $index"),
                  ),
                ],
              ),
              subtitle: Row(
                children: [
                  Icon(Icons.timelapse, size: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text('13 Febuari 2023 | 09:34:23 WIB'),
                  ),
                ],
              ),
              trailing: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Icon(
                      Icons.water_drop_rounded,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Text('76%'),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 1,
              thickness: 1,
              color: Color.fromARGB(255, 10, 85, 126),
            );
          },
        ),
      ),
    );
  }
}
