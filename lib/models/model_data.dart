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
    data['SensorDigital'] = this.sensorDigital;
    data['StatusKeranAir'] = this.statusKeranAir;
    data['Waktu'] = this.waktu;
    return data;
  }
}
