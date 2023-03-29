// ignore_for_file: file_names
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:penyiraman_jambu_iot/models/model_data.dart';

// ignore: camel_case_types
class Sampel1Controller extends GetxController {
  Query dbRef = FirebaseDatabase.instance
      .ref()
      .child('ProjectTugasAkhirArbi/ObjSampel1/SensorDigital');

  var obj = ModelSatu().obs;

  Future<void> initData() async {
    dbRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      obj.value = ModelSatu.fromJson(data as Map);
    });
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
