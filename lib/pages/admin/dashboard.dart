import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.emailUser});

  final String emailUser;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late String emailInput;
  late String passInput;

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
                      child: const Text(
                        'SAMPEL 1',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: const Text(
                        'Terakhir disiram 2 jam yang lalu',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(70, 20, 70, 0),
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: SfRadialGauge(
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
                              pointers: const <GaugePointer>[
                                RangePointer(
                                  value: 78,
                                  cornerStyle: CornerStyle.bothCurve,
                                  width: 25,
                                  sizeUnit: GaugeSizeUnit.logicalPixel,
                                  gradient: SweepGradient(
                                    colors: <Color>[
                                      Colors.yellow,
                                      Colors.green,
                                    ],
                                  ),
                                ),
                              ],
                              annotations: const <GaugeAnnotation>[
                                GaugeAnnotation(
                                  angle: 90,
                                  axisValue: 5,
                                  positionFactor: 0.1,
                                  widget: Text(
                                    "78",
                                    // '${dataObjSatu.obj.value.sensorDigital}',
                                    style: TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 10, 85, 126),
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
                      ),
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
                      child: const Text(
                        'SAMPEL 2',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: const Text(
                        'Terakhir disiram 45 menit yang lalu',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(70, 20, 70, 0),
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: SfRadialGauge(
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
                              pointers: const <GaugePointer>[
                                RangePointer(
                                  value: 92,
                                  cornerStyle: CornerStyle.bothCurve,
                                  width: 25,
                                  sizeUnit: GaugeSizeUnit.logicalPixel,
                                  gradient: SweepGradient(
                                    colors: <Color>[
                                      Colors.yellow,
                                      Colors.green,
                                    ],
                                  ),
                                ),
                              ],
                              annotations: const <GaugeAnnotation>[
                                GaugeAnnotation(
                                  angle: 90,
                                  axisValue: 5,
                                  positionFactor: 0.1,
                                  widget: Text(
                                    "92",
                                    // '${dataObjSatu.obj.value.sensorDigital}',
                                    style: TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          // backgroundColor:
                          //     const Color.fromARGB(255, 10, 85, 126),
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
                      ),
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
}
