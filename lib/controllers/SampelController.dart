// ignore_for_file: file_names
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:penyiraman_jambu_iot/models/model_data.dart';

// ignore: camel_case_types
class SampelController extends GetxController {
  Query dbRef1 =
      FirebaseDatabase.instance.ref().child('ProjectTugasAkhirArbi/ObjSampel1');
  Query dbRef2 =
      FirebaseDatabase.instance.ref().child('ProjectTugasAkhirArbi/ObjSampel2');

  var objSatu = ModelSatu().obs;
  var objDua = ModelDua().obs;

  Future<void> initData() async {
    dbRef1.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      objSatu.value = ModelSatu.fromJson(data as Map);
    });
    dbRef2.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      objDua.value = ModelDua.fromJson(data as Map);
    });
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
