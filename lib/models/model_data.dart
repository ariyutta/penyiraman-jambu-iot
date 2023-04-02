// ignore_for_file: unnecessary_new, prefer_collection_literals

import 'package:get/get.dart';

class ModelSatu {
  int? sensorDigital;
  bool? statusKeranAir;
  String? waktu;

  ModelSatu({
    this.sensorDigital,
    this.statusKeranAir,
    this.waktu,
  });

  ModelSatu.fromJson(Map<dynamic, dynamic> json) {
    sensorDigital = json['SensorDigital'];
    statusKeranAir = json['StatusKeranAir'];
    waktu = json['Waktu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SensorDigital'] = sensorDigital.obs;
    data['StatusKeranAir'] = statusKeranAir.obs;
    data['Waktu'] = waktu.obs;
    return data;
  }
}

class ModelDua {
  int? sensorDigital;
  bool? statusKeranAir;
  String? waktu;

  ModelDua({
    this.sensorDigital,
    this.statusKeranAir,
    this.waktu,
  });

  ModelDua.fromJson(Map<dynamic, dynamic> json) {
    sensorDigital = json['SensorDigital'];
    statusKeranAir = json['StatusKeranAir'];
    waktu = json['Waktu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SensorDigital'] = sensorDigital.obs;
    data['StatusKeranAir'] = statusKeranAir.obs;
    data['Waktu'] = waktu.obs;
    return data;
  }
}
