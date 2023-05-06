// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_import, deprecated_member_use

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penyiraman_jambu_iot/controllers/HomeController.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:penyiraman_jambu_iot/controllers/SampelController.dart';

class Pengaturan extends StatefulWidget {
  const Pengaturan({super.key});

  @override
  State<Pengaturan> createState() => _PengaturanState();
}

class _PengaturanState extends State<Pengaturan> {
  HomeController home = Get.put(HomeController());
  SampelController models = Get.put(SampelController());
  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

  int parameterMin = 78;
  int parameterMax = 90;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 130, 10, 10),
      child: Column(
        children: [
          Center(
            child: Card(
              shape: CircleBorder(),
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(13.0),
                child: Column(
                  children: [
                    Container(
                      width: 130.0,
                      height: 130.0,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/logo-apps-circle.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Arbi Yudatama',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '(Administrator)',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'KENDALI OTOMATIS',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Obx(
                                () {
                                  return FlutterSwitch(
                                    width: 90,
                                    height: 40,
                                    valueFontSize: 20,
                                    toggleSize: 30,
                                    value: models.objOtomatis.value.statusAktif
                                        as bool,
                                    borderRadius: 30.0,
                                    padding: 8.0,
                                    showOnOff: false,
                                    onToggle: (val) {
                                      setState(() {
                                        models.objOtomatis.value.statusAktif =
                                            val;
                                        if (models.objOtomatis.value
                                                .statusAktif ==
                                            true) {
                                          databaseReference
                                              .child('ProjectTugasAkhirArbi')
                                              .child('ObjOtomatis')
                                              .update(
                                            {
                                              'StatusAktif': true,
                                            },
                                          );
                                        } else {
                                          databaseReference
                                              .child('ProjectTugasAkhirArbi')
                                              .child('ObjOtomatis')
                                              .update(
                                            {
                                              'StatusAktif': false,
                                            },
                                          );
                                        }
                                      });
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Card(
                        elevation: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Column(
                                children: [
                                  Text(
                                    'SAMPEL 1',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Obx(
                                      () {
                                        return FlutterSwitch(
                                          width: 90,
                                          height: 40,
                                          valueFontSize: 19,
                                          toggleSize: 30,
                                          value: models.objSatu.value
                                              .statusKeranAir as bool,
                                          borderRadius: 30.0,
                                          padding: 8.0,
                                          showOnOff: true,
                                          activeText: 'ON',
                                          inactiveText: 'OFF',
                                          onToggle: (val) {
                                            setState(() {
                                              if (models.objOtomatis.value
                                                      .statusAktif ==
                                                  true) {
                                                if (models.objSatu.value
                                                        .statusKeranAir ==
                                                    true) {
                                                  if (models.objSatu.value
                                                          .sensorDigital! >=
                                                      parameterMin) {
                                                    if (models.objSatu.value
                                                            .sensorDigital! <=
                                                        parameterMax) {
                                                      // TOMBOL OTOMATIS
                                                    } else {
                                                      // TOMBOL OTOMATIS
                                                    }
                                                  } else {
                                                    // TOMBOL OTOMATIS
                                                  }
                                                } else {
                                                  if (models.objSatu.value
                                                          .sensorDigital! >=
                                                      parameterMin) {
                                                    if (models.objSatu.value
                                                            .sensorDigital! <=
                                                        parameterMax) {
                                                      // TOMBOL OTOMATIS
                                                    } else {
                                                      // TOMBOL OTOMATIS
                                                    }
                                                  } else {
                                                    // TOMBOL OTOMATIS
                                                  }
                                                }
                                              } else {
                                                if (models.objSatu.value
                                                        .statusKeranAir ==
                                                    true) {
                                                  if (models.objSatu.value
                                                          .sensorDigital! >=
                                                      parameterMin) {
                                                    if (models.objSatu.value
                                                            .sensorDigital! <=
                                                        parameterMax) {
                                                      models.objSatu.value
                                                          .statusKeranAir = val;
                                                      databaseReference
                                                          .child(
                                                              'ProjectTugasAkhirArbi')
                                                          .child('ObjSampel1')
                                                          .update(
                                                        {
                                                          'StatusKeranAir':
                                                              false,
                                                        },
                                                      );
                                                    } else {
                                                      models.objSatu.value
                                                          .statusKeranAir = val;
                                                      databaseReference
                                                          .child(
                                                              'ProjectTugasAkhirArbi')
                                                          .child('ObjSampel1')
                                                          .update(
                                                        {
                                                          'StatusKeranAir':
                                                              false,
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    models.objSatu.value
                                                        .statusKeranAir = val;
                                                    databaseReference
                                                        .child(
                                                            'ProjectTugasAkhirArbi')
                                                        .child('ObjSampel1')
                                                        .update(
                                                      {
                                                        'StatusKeranAir': false,
                                                      },
                                                    );
                                                  }
                                                } else {
                                                  if (models.objSatu.value
                                                          .sensorDigital! >=
                                                      parameterMin) {
                                                    if (models.objSatu.value
                                                            .sensorDigital! <=
                                                        parameterMax) {
                                                      models.objSatu.value
                                                          .statusKeranAir = val;
                                                      databaseReference
                                                          .child(
                                                              'ProjectTugasAkhirArbi')
                                                          .child('ObjSampel1')
                                                          .update(
                                                        {
                                                          'StatusKeranAir':
                                                              true,
                                                        },
                                                      );
                                                    } else {
                                                      models.objSatu.value
                                                          .statusKeranAir = val;
                                                      databaseReference
                                                          .child(
                                                              'ProjectTugasAkhirArbi')
                                                          .child('ObjSampel1')
                                                          .update(
                                                        {
                                                          'StatusKeranAir':
                                                              true,
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    models.objSatu.value
                                                        .statusKeranAir = val;
                                                    databaseReference
                                                        .child(
                                                            'ProjectTugasAkhirArbi')
                                                        .child('ObjSampel1')
                                                        .update(
                                                      {
                                                        'StatusKeranAir': true,
                                                      },
                                                    );
                                                  }
                                                }
                                              }
                                            });
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Column(
                                children: [
                                  Text(
                                    'SAMPEL 2',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Obx(
                                      () {
                                        return FlutterSwitch(
                                          width: 90,
                                          height: 40,
                                          valueFontSize: 19,
                                          toggleSize: 30,
                                          value: models.objDua.value
                                              .statusKeranAir as bool,
                                          borderRadius: 30.0,
                                          padding: 8.0,
                                          showOnOff: true,
                                          activeText: 'ON',
                                          inactiveText: 'OFF',
                                          onToggle: (val) {
                                            setState(() {
                                              if (models.objOtomatis.value
                                                      .statusAktif ==
                                                  true) {
                                                if (models.objDua.value
                                                        .statusKeranAir ==
                                                    true) {
                                                  if (models.objDua.value
                                                          .sensorDigital! >=
                                                      parameterMin) {
                                                    if (models.objDua.value
                                                            .sensorDigital! <=
                                                        parameterMax) {
                                                      // TOMBOL OTOMATIS
                                                    } else {
                                                      // TOMBOL OTOMATIS
                                                    }
                                                  } else {
                                                    // TOMBOL OTOMATIS
                                                  }
                                                } else {
                                                  if (models.objDua.value
                                                          .sensorDigital! >=
                                                      parameterMin) {
                                                    if (models.objDua.value
                                                            .sensorDigital! <=
                                                        parameterMax) {
                                                      // TOMBOL OTOMATIS
                                                    } else {
                                                      // TOMBOL OTOMATIS
                                                    }
                                                  } else {
                                                    // TOMBOL OTOMATIS
                                                  }
                                                }
                                              } else {
                                                if (models.objDua.value
                                                        .statusKeranAir ==
                                                    true) {
                                                  if (models.objDua.value
                                                          .sensorDigital! >=
                                                      parameterMin) {
                                                    if (models.objDua.value
                                                            .sensorDigital! <=
                                                        parameterMax) {
                                                      models.objDua.value
                                                          .statusKeranAir = val;
                                                      databaseReference
                                                          .child(
                                                              'ProjectTugasAkhirArbi')
                                                          .child('ObjSampel2')
                                                          .update(
                                                        {
                                                          'StatusKeranAir':
                                                              false,
                                                        },
                                                      );
                                                    } else {
                                                      models.objDua.value
                                                          .statusKeranAir = val;
                                                      databaseReference
                                                          .child(
                                                              'ProjectTugasAkhirArbi')
                                                          .child('ObjSampel2')
                                                          .update(
                                                        {
                                                          'StatusKeranAir':
                                                              false,
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    models.objDua.value
                                                        .statusKeranAir = val;
                                                    databaseReference
                                                        .child(
                                                            'ProjectTugasAkhirArbi')
                                                        .child('ObjSampel2')
                                                        .update(
                                                      {
                                                        'StatusKeranAir': false,
                                                      },
                                                    );
                                                  }
                                                } else {
                                                  if (models.objDua.value
                                                          .sensorDigital! >=
                                                      parameterMin) {
                                                    if (models.objDua.value
                                                            .sensorDigital! <=
                                                        parameterMax) {
                                                      models.objDua.value
                                                          .statusKeranAir = val;
                                                      databaseReference
                                                          .child(
                                                              'ProjectTugasAkhirArbi')
                                                          .child('ObjSampel2')
                                                          .update(
                                                        {
                                                          'StatusKeranAir':
                                                              true,
                                                        },
                                                      );
                                                    } else {
                                                      models.objDua.value
                                                          .statusKeranAir = val;
                                                      databaseReference
                                                          .child(
                                                              'ProjectTugasAkhirArbi')
                                                          .child('ObjSampel2')
                                                          .update(
                                                        {
                                                          'StatusKeranAir':
                                                              true,
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    models.objDua.value
                                                        .statusKeranAir = val;
                                                    databaseReference
                                                        .child(
                                                            'ProjectTugasAkhirArbi')
                                                        .child('ObjSampel2')
                                                        .update(
                                                      {
                                                        'StatusKeranAir': true,
                                                      },
                                                    );
                                                  }
                                                }
                                              }
                                            });
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                          onPressed: () => {
                            home.prosesLogout(context),
                          },
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              'SIGN OUT',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
