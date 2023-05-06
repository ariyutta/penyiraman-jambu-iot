// ignore_for_file: unnecessary_new, prefer_collection_literals, camel_case_types, unnecessary_this

import 'package:get/get.dart';

class ModelSatu {
  int? sensorDigital;
  bool? statusKeranAir;
  String? waktu;
  String? waktuRealtime;

  ModelSatu({
    this.sensorDigital,
    this.statusKeranAir,
    this.waktu,
    this.waktuRealtime,
  });

  ModelSatu.fromJson(Map<dynamic, dynamic> json) {
    sensorDigital = json['SensorDigital'];
    statusKeranAir = json['StatusKeranAir'];
    waktu = json['Waktu'];
    waktuRealtime = json['WaktuRealtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SensorDigital'] = sensorDigital.obs;
    data['StatusKeranAir'] = statusKeranAir.obs;
    data['Waktu'] = waktu.obs;
    data['WaktuRealtime'] = waktuRealtime.obs;
    return data;
  }
}

class ModelDua {
  int? sensorDigital;
  bool? statusKeranAir;
  String? waktu;
  String? waktuRealtime;

  ModelDua({
    this.sensorDigital,
    this.statusKeranAir,
    this.waktu,
    this.waktuRealtime,
  });

  ModelDua.fromJson(Map<dynamic, dynamic> json) {
    sensorDigital = json['SensorDigital'];
    statusKeranAir = json['StatusKeranAir'];
    waktu = json['Waktu'];
    waktuRealtime = json['WaktuRealtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SensorDigital'] = sensorDigital.obs;
    data['StatusKeranAir'] = statusKeranAir.obs;
    data['Waktu'] = waktu.obs;
    data['WaktuRealtime'] = waktuRealtime.obs;
    return data;
  }
}

class statusPompaAir {
  bool? statusAktif;

  statusPompaAir({this.statusAktif});

  statusPompaAir.fromJson(Map<dynamic, dynamic> json) {
    statusAktif = json['StatusAktif'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StatusAktif'] = this.statusAktif.obs;
    return data;
  }
}

class Otomatis {
  bool? statusAktif;

  Otomatis({this.statusAktif});

  Otomatis.fromJson(Map<dynamic, dynamic> json) {
    statusAktif = json['StatusAktif'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StatusAktif'] = this.statusAktif.obs;
    return data;
  }
}
