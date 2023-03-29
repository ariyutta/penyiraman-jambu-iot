import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penyiraman_jambu_iot/controllers/Sampel1Controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SampelSatu extends StatefulWidget {
  const SampelSatu({super.key});

  @override
  State<SampelSatu> createState() => _SampelSatuState();
}

class _SampelSatuState extends State<SampelSatu> {
  // Keran Air
  bool terbuka = true;
  bool tertutup = false;

  Sampel1Controller models = Get.put(Sampel1Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 85, 126),
        elevation: 0,
        title: const Text(
          "Sampel 1",
          style: TextStyle(fontSize: 25),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 221, 235, 255),
      // ignore: avoid_unnecessary_containers
      body: Stack(
        children: [
          Column(
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                width: double.infinity,
                // color: Colors.blue,
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 64),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bg_detail.png'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                ),
                child: Column(
                  children: const [
                    Icon(
                      Icons.water_outlined,
                      size: 100,
                      color: Colors.white,
                    ),
                    Text(
                      'STATUS KELEMBABAN TANAH',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Telah disiram 2 jam yang lalu',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            child: Center(
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 250, 10, 10),
                child: Column(
                  children: [
                    Card(
                      elevation: 15,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: const Text(
                              'Persentase (%)',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(80, 20, 80, 0),
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
                                    pointers: <GaugePointer>[
                                      RangePointer(
                                        value: 78,
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
                                          "78",
                                          // '${dataObjSatu.obj.value.sensorDigital}',
                                          style: const TextStyle(
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
                        ],
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(
                                Icons.analytics,
                                size: 50,
                                // color: Colors.green,
                              ),
                              title: const Text(
                                'Status Keran Air',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // subtitle: Text(
                              //   'Telah disiram 2 jam yang lalu',
                              //   style: TextStyle(fontSize: 12),
                              // ),
                              trailing: tertutup
                                  ? TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        foregroundColor: Colors.white,
                                      ),
                                      onPressed: () => {
                                        // areaDepanPage(),
                                      },
                                      child: Text(
                                        'BUKA',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  : TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        foregroundColor: Colors.white,
                                      ),
                                      onPressed: () => {
                                        // areaDepanPage(),
                                      },
                                      child: Text(
                                        'TUTUP',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
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
        ],
      ),
    );
  }
}
