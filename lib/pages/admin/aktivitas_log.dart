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
      child: ListView.separated(
        itemCount: 11,
        itemBuilder: (context, int index) {
          return Card(
            elevation: 5,
            child: ListTile(
              title: Card(
                elevation: 1,
                child: Row(
                  children: [
                    Icon(Icons.grass, size: 30, color: Colors.green),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Sampel $index",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              subtitle: Card(
                elevation: 1,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.alarm, size: 30),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text('13/02/2023 | 09:34:23 WIB'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.tungsten_outlined, size: 30),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text('Kelembaban : 78%'),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              trailing: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Icon(
                      Icons.phonelink_outlined,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Text(
                      'Keran Aktif',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 0,
            // thickness: 1,
            // color: Color.fromARGB(255, 10, 85, 126),
          );
        },
      ),
    );
  }
}
