import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penyiraman_jambu_iot/controllers/SampelController.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.emailUser});

  final String emailUser;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  SampelController models = Get.put(SampelController());

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
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 250, 10, 10),
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
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'SAMPEL 1',
                          style: TextStyle(
                            fontSize: 20,
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
                          'Terakhir disiram 2 jam yang lalu',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(70, 20, 70, 0),
                      child: SizedBox(
                        width: 200,
                        height: 200,
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
                                        '${models.objSatu.value.sensorDigital}',
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
            // Card
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
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'SAMPEL 2',
                          style: TextStyle(
                            fontSize: 20,
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
                          'Terakhir disiram 45 menit yang lalu',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(70, 20, 70, 0),
                      child: SizedBox(
                        width: 200,
                        height: 200,
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
                                        '${models.objDua.value.sensorDigital}',
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
                style: TextStyle(fontSize: 18),
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
              style: TextStyle(fontSize: 18),
            ),
          ),
        );
      }
    } else {
      if (models.objSatu.value.sensorDigital! >= parameterMin) {
        if (models.objSatu.value.sensorDigital! < parameterMax) {
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
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'PENYIRAMAN SUDAH DILAKUKAN',
                style: TextStyle(fontSize: 18),
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
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'PENYIRAMAN SEDANG DILAKUKAN',
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        }
      } else {
        return TextButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 10, 85, 126),
            foregroundColor: Colors.white,
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
              'MULAI PENYIRAMAN',
              style: TextStyle(fontSize: 18),
            ),
          ),
        );
      }
    }
  }

  Widget kondisiDua() {
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
                style: TextStyle(fontSize: 18),
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
              style: TextStyle(fontSize: 18),
            ),
          ),
        );
      }
    } else {
      if (models.objDua.value.sensorDigital! >= parameterMin) {
        if (models.objDua.value.sensorDigital! < parameterMax) {
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
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'PENYIRAMAN SUDAH DILAKUKAN',
                style: TextStyle(fontSize: 18),
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
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'PENYIRAMAN SEDANG DILAKUKAN',
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        }
      } else {
        return TextButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 10, 85, 126),
            foregroundColor: Colors.white,
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
              'MULAI PENYIRAMAN',
              style: TextStyle(fontSize: 18),
            ),
          ),
        );
      }
    }
  }
}
