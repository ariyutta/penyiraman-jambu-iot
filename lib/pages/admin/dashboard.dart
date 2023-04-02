// ignore_for_file: unnecessary_string_interpolations, unnecessary_brace_in_string_interps, sized_box_for_whitespace, prefer_const_constructors, deprecated_member_use, depend_on_referenced_packages, avoid_print, unnecessary_cast, unused_local_variable

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penyiraman_jambu_iot/controllers/SampelController.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.emailUser});

  final String emailUser;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  SampelController models = Get.put(SampelController());
  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

  int parameterMin = 70;
  int parameterMax = 90;

  bool keranBuka = true;
  bool keranTutup = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    if (models.objSatu.value.waktu == null) {
      models.objSatu.value.waktu =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    } else {
      models.objSatu.value.waktu = models.objSatu.value.waktu;
    }

    String convertTanggal = models.objSatu.value.waktu.toString();
    final getFB = DateTime.parse(convertTanggal);
    final getTanggal = DateTime(getFB.year, getFB.month, getFB.day, getFB.hour,
        getFB.minute, getFB.second);
    final difference = now.difference(getTanggal);
    final hours = difference.inSeconds.abs().obs;

    int detik = hours.value;
    int menit = detik ~/ 60;

    String tipe = '';
    if (hours.value >= 60) {
      tipe = 'menit yang lalu';
    } else if (hours.value >= 3600) {
      tipe = 'jam yang lalu';
    } else if (hours.value >= 86400) {
      tipe = 'hari yang lalu';
    } else {
      tipe = 'detik yang lalu';
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(10, 230, 10, 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'SAMPEL 1',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Text(
                          'Telah disiram ${menit} ${tipe}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(70, 20, 70, 0),
                      child: SizedBox(
                        width: 180,
                        height: 180,
                        child: Obx(
                          () {
                            return SfRadialGauge(
                              axes: <RadialAxis>[
                                RadialAxis(
                                  maximum: 100,
                                  radiusFactor: 1,
                                  startAngle: 135,
                                  endAngle: 45,
                                  showLabels: false,
                                  showTicks: false,
                                  axisLineStyle: const AxisLineStyle(
                                    cornerStyle: CornerStyle.bothFlat,
                                    thickness: 25,
                                  ),
                                  pointers: <GaugePointer>[
                                    RangePointer(
                                      value:
                                          (models.objSatu.value.sensorDigital)
                                                  ?.toDouble() ??
                                              0,
                                      cornerStyle: CornerStyle.bothCurve,
                                      width: 25,
                                      sizeUnit: GaugeSizeUnit.logicalPixel,
                                      gradient: const SweepGradient(
                                        colors: <Color>[
                                          Colors.orange,
                                          Colors.yellow,
                                          Colors.green,
                                        ],
                                      ),
                                    ),
                                  ],
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(
                                      angle: 90,
                                      axisValue: 5,
                                      positionFactor: 0.1,
                                      widget: Text(
                                        // "78",
                                        '${models.objSatu.value.sensorDigital ?? 0}',
                                        style: const TextStyle(
                                          fontSize: 60,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Obx(
                      () {
                        return Container(
                          width: double.infinity,
                          child: kondisiSatu(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            //
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'SAMPEL 2',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Text(
                          'Telah disiram ${menit} ${tipe}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(70, 20, 70, 0),
                      child: SizedBox(
                        width: 180,
                        height: 180,
                        child: Obx(
                          () {
                            return SfRadialGauge(
                              axes: <RadialAxis>[
                                RadialAxis(
                                  maximum: 100,
                                  radiusFactor: 1,
                                  startAngle: 135,
                                  endAngle: 45,
                                  showLabels: false,
                                  showTicks: false,
                                  axisLineStyle: const AxisLineStyle(
                                    cornerStyle: CornerStyle.bothFlat,
                                    thickness: 25,
                                  ),
                                  pointers: <GaugePointer>[
                                    RangePointer(
                                      value: (models.objDua.value.sensorDigital)
                                              ?.toDouble() ??
                                          0,
                                      cornerStyle: CornerStyle.bothCurve,
                                      width: 25,
                                      sizeUnit: GaugeSizeUnit.logicalPixel,
                                      gradient: const SweepGradient(
                                        colors: <Color>[
                                          Colors.orange,
                                          Colors.yellow,
                                          Colors.green,
                                        ],
                                      ),
                                    ),
                                  ],
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(
                                      angle: 90,
                                      axisValue: 5,
                                      positionFactor: 0.1,
                                      widget: Text(
                                        // "78",
                                        '${models.objDua.value.sensorDigital ?? 0}',
                                        style: const TextStyle(
                                          fontSize: 60,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Obx(
                      () {
                        return Container(
                          width: double.infinity,
                          child: kondisiDua(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            // Card
          ],
        ),
      ),
    );
  }

  Widget kondisiSatu() {
    final now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

    if (models.objSatu.value.sensorDigital == null) {
      models.objSatu.value.sensorDigital = 0;
    } else {
      models.objSatu.value.sensorDigital = models.objSatu.value.sensorDigital;
    }
    //
    if (models.objSatu.value.statusKeranAir == keranBuka) {
      // print('Program Jalan');
      // return Text('Program Jalan');
      if (models.objSatu.value.sensorDigital! >= parameterMin) {
        if (models.objSatu.value.sensorDigital! <= parameterMax) {
          return TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            onPressed: () => {
              // TOMBOL PENYIRAMAN
            },
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'PENYIRAMAN SEDANG DILAKUKAN',
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        } else {
          return TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            onPressed: () => {
              // TOMBOL PENYIRAMAN
            },
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'PENYIRAMAN MELEWATI BATAS PARAMETER',
                style: TextStyle(fontSize: 14),
              ),
            ),
          );
        }
      } else {
        return TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
          onPressed: () => {
            // TOMBOL PENYIRAMAN
          },
          child: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'PENYIRAMAN SEDANG DILAKUKAN',
              style: TextStyle(fontSize: 16),
            ),
          ),
        );
      }
    } else {
      // print('Program Tidak Jalan');
      // return Text('Program Tidak Jalan');
      if (models.objSatu.value.sensorDigital! >= parameterMin) {
        if (models.objSatu.value.sensorDigital! <= parameterMax) {
          return TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            onPressed: () => {
              // TOMBOL PENYIRAMAN
            },
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'PENYIRAMAN SUDAH DILAKUKAN',
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        } else {
          return TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            onPressed: () => {
              // TOMBOL PENYIRAMAN
            },
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'PENYIRAMAN SUDAH DILAKUKAN',
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        }
      } else {
        return TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 10, 85, 126),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
          onPressed: () => {
            databaseReference
                .child('ProjectTugasAkhirArbi')
                .child('ObjSampel1')
                .set(
              {
                'StatusKeranAir': true,
                'SensorDigital': models.objSatu.value.sensorDigital,
                'Waktu': '${formattedDate}',
              },
            )
          },
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'MULAI PENYIRAMAN',
              style: TextStyle(fontSize: 16),
            ),
          ),
        );
      }
    }
  }

  Widget kondisiDua() {
    final now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

    if (models.objDua.value.sensorDigital == null) {
      models.objDua.value.sensorDigital = 0;
    } else {
      models.objDua.value.sensorDigital = models.objDua.value.sensorDigital;
    }
    //
    if (models.objDua.value.statusKeranAir == keranBuka) {
      // print('Program Jalan');
      // return Text('Program Jalan');
      if (models.objDua.value.sensorDigital! >= parameterMin) {
        if (models.objDua.value.sensorDigital! <= parameterMax) {
          return TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            onPressed: () => {
              // TOMBOL PENYIRAMAN
            },
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'PENYIRAMAN SEDANG DILAKUKAN',
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        } else {
          return TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            onPressed: () => {
              // TOMBOL PENYIRAMAN
            },
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'PENYIRAMAN MELEWATI BATAS PARAMETER',
                style: TextStyle(fontSize: 14),
              ),
            ),
          );
        }
      } else {
        return TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
          onPressed: () => {
            // TOMBOL PENYIRAMAN
          },
          child: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'PENYIRAMAN SEDANG DILAKUKAN',
              style: TextStyle(fontSize: 16),
            ),
          ),
        );
      }
    } else {
      // print('Program Tidak Jalan');
      // return Text('Program Tidak Jalan');
      if (models.objDua.value.sensorDigital! >= parameterMin) {
        if (models.objDua.value.sensorDigital! <= parameterMax) {
          return TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            onPressed: () => {
              // TOMBOL PENYIRAMAN
            },
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'PENYIRAMAN SUDAH DILAKUKAN',
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        } else {
          return TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            onPressed: () => {
              // TOMBOL PENYIRAMAN
            },
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'PENYIRAMAN SUDAH DILAKUKAN',
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        }
      } else {
        return TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 10, 85, 126),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
          onPressed: () => {
            databaseReference
                .child('ProjectTugasAkhirArbi')
                .child('ObjSampel2')
                .set(
              {
                'StatusKeranAir': true,
                'SensorDigital': models.objDua.value.sensorDigital,
                'Waktu': '${formattedDate}',
              },
            )
          },
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'MULAI PENYIRAMAN',
              style: TextStyle(fontSize: 16),
            ),
          ),
        );
      }
    }
  }
}
