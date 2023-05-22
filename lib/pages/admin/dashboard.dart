// ignore_for_file: unnecessary_string_interpolations, unnecessary_brace_in_string_interps, sized_box_for_whitespace, prefer_const_constructors, deprecated_member_use, depend_on_referenced_packages, avoid_print, unnecessary_cast, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_declarations

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

  int parameterMin = 78;
  int parameterMax = 90;

  bool keranBuka = true;
  bool keranTutup = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 230, 10, 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Obx(
                () {
                  return Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        children: [
                          statusPompaAir(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(13.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
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
                        child: Obx(
                          () {
                            final now = DateTime.now();

                            if (models.objSatu.value.waktu == null) {
                              models.objSatu.value.waktu =
                                  DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
                              models.objSatu.value.waktuRealtime =
                                  DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
                            } else {
                              models.objSatu.value.waktu =
                                  models.objSatu.value.waktu;
                              models.objSatu.value.waktuRealtime =
                                  models.objSatu.value.waktuRealtime;
                            }

                            String convertTanggal =
                                models.objSatu.value.waktu.toString();

                            final realtime = DateTime.parse(
                                models.objSatu.value.waktuRealtime as String);

                            final getFB = DateTime.parse(convertTanggal);

                            final getTanggal = DateTime(
                                getFB.year,
                                getFB.month,
                                getFB.day,
                                getFB.hour,
                                getFB.minute,
                                getFB.second);

                            final difference = realtime.difference(getTanggal);

                            final hours = difference.inSeconds.abs().obs;

                            int detik = 0;
                            int menit = 0;
                            int jam = 0;
                            int hari = 0;
                            int waktu = 0;

                            detik = hours.value;
                            menit = detik ~/ 60;
                            jam = detik ~/ 3600;
                            hari = detik ~/ 86000;

                            String tipe = '';

                            if (detik >= 0 && detik <= 59) {
                              tipe = 'detik yang lalu';
                              waktu = detik;
                            } else if (detik >= 60 && detik <= 3599) {
                              tipe = 'menit yang lalu';
                              waktu = menit;
                            } else if (detik >= 3600 && detik <= 85999) {
                              tipe = 'jam yang lalu';
                              waktu = jam;
                            } else if (detik >= 86000) {
                              tipe = 'hari yang lalu';
                              waktu = hari;
                            } else {
                              tipe = '';
                            }
                            return Text(
                              'Telah disiram ${waktu} ${tipe}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            );
                          },
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
                        child: Obx(
                          () {
                            final now2 = DateTime.now();

                            if (models.objDua.value.waktu == null) {
                              models.objDua.value.waktu =
                                  DateFormat('yyyy-MM-dd HH:mm:ss')
                                      .format(now2);
                              models.objDua.value.waktuRealtime =
                                  DateFormat('yyyy-MM-dd HH:mm:ss')
                                      .format(now2);
                            } else {
                              models.objDua.value.waktu =
                                  models.objDua.value.waktu;
                              models.objDua.value.waktuRealtime =
                                  models.objDua.value.waktuRealtime;
                            }

                            String convertTanggal2 =
                                models.objDua.value.waktu.toString();

                            final realtime2 = DateTime.parse(
                                models.objDua.value.waktuRealtime as String);

                            final getFB2 = DateTime.parse(convertTanggal2);

                            final getTanggal2 = DateTime(
                                getFB2.year,
                                getFB2.month,
                                getFB2.day,
                                getFB2.hour,
                                getFB2.minute,
                                getFB2.second);

                            final difference2 =
                                realtime2.difference(getTanggal2);

                            final hours2 = difference2.inSeconds.abs().obs;

                            int detik2 = 0;
                            int menit2 = 0;
                            int jam2 = 0;
                            int hari2 = 0;
                            int waktu2 = 0;

                            detik2 = hours2.value;
                            menit2 = detik2 ~/ 60;
                            jam2 = detik2 ~/ 3600;
                            hari2 = detik2 ~/ 86000;

                            String tipe2 = '';

                            if (detik2 >= 0 && detik2 <= 59) {
                              tipe2 = 'detik2 yang lalu';
                              waktu2 = detik2;
                            } else if (detik2 >= 60 && detik2 <= 3599) {
                              tipe2 = 'menit yang lalu';
                              waktu2 = menit2;
                            } else if (detik2 >= 3600 && detik2 <= 85999) {
                              tipe2 = 'jam yang lalu';
                              waktu2 = jam2;
                            } else if (detik2 >= 86000) {
                              tipe2 = 'hari yang lalu';
                              waktu2 = hari2;
                            } else {
                              tipe2 = '';
                            }
                            return Text(
                              'Telah disiram ${waktu2} ${tipe2}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            );
                          },
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
      models.objSatu.value.waktuRealtime =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    } else {
      models.objSatu.value.sensorDigital = models.objSatu.value.sensorDigital;
      models.objSatu.value.waktuRealtime = models.objSatu.value.waktuRealtime;
    }

    if (models.objOtomatis.value.statusAktif == true) {
      if (models.objSatu.value.statusKeranAir == keranBuka) {
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
              foregroundColor: Colors.red,
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
                'SAMPEL HARUS DISIRAM',
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        }
      }
    } else {
      if (models.objSatu.value.statusKeranAir == keranBuka) {
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
                // TOMBOL AKSI
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
                foregroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onPressed: () => {
                // TOMBOL AKSI
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
          return TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            onPressed: () => {
              // TOMBOL AKSI
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
              foregroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            onPressed: () => {
              // TOMBOL AKSI
            },
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'SAMPEL HARUS DISIRAM',
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        }
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

    if (models.objOtomatis.value.statusAktif == true) {
      if (models.objDua.value.statusKeranAir == keranBuka) {
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
              foregroundColor: Colors.red,
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
                'SAMPEL HARUS DISIRAM',
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        }
      }
    } else {
      if (models.objDua.value.statusKeranAir == keranBuka) {
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
                // TOMBOL AKSI
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
                foregroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onPressed: () => {
                // TOMBOL AKSI
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
          return TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            onPressed: () => {
              // TOMBOL AKSI
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
              foregroundColor: Colors.red,
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
                'SAMPEL HARUS DISIRAM',
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        }
      }
    }
  }

  Widget statusPompaAir() {
    if (models.objPompa.value.statusAktif == keranTutup) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'STATUS MESIN AIR : ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.red,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Text(
                    'TIDAK AKTIF',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'STATUS MESIN AIR : ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.green,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Text(
                    'AKTIF',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      );
    }
  }
}
