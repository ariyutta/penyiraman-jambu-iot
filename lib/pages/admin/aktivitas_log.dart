// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:penyiraman_jambu_iot/controllers/DataLogController.dart';

class DataLog extends StatefulWidget {
  const DataLog({super.key});

  @override
  State<DataLog> createState() => _DataLogState();
}

class _DataLogState extends State<DataLog> {
  DataLogController dataLog = Get.put(DataLogController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 230, 10, 10),
      child: SingleChildScrollView(
        child: Obx(() {
          return Column(
            children: [
              ...dataLog.listHistory.map(
                (e) => Card(
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
                              e.lokasi ?? '',
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
                                    child: Text(
                                        '${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.parse(e.waktu ?? DateTime.now.toString()))}'),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.tungsten_outlined, size: 30),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                        'Kelembaban : ${e.kelembaban ?? 0}%'),
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
                          child: (e.statusKeranAir ?? false)
                              ? Icon(
                                  Icons.phonelink_outlined,
                                  size: 30,
                                  color: Colors.blue,
                                )
                              : Icon(
                                  Icons.phonelink_outlined,
                                  size: 30,
                                  color: Colors.red,
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: (e.statusKeranAir ?? false)
                              ? Text(
                                  'Keran Aktif',
                                )
                              : Text(
                                  'Keran Tidak Aktif',
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
