// ignore_for_file: file_names, unused_local_variable, unused_import
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:penyiraman_jambu_iot/models/model_data.dart';

// ignore: camel_case_types
class SampelController extends GetxController {
  Query dbRef1 =
      FirebaseDatabase.instance.ref().child('ProjectTugasAkhirArbi/ObjSampel1');
  Query dbRef2 =
      FirebaseDatabase.instance.ref().child('ProjectTugasAkhirArbi/ObjSampel2');
  Query pompaAir = FirebaseDatabase.instance
      .ref()
      .child('ProjectTugasAkhirArbi/ObjPompaAir');
  Query setAuto = FirebaseDatabase.instance
      .ref()
      .child('ProjectTugasAkhirArbi/ObjOtomatis');

  var objSatu = ModelSatu().obs;
  var objDua = ModelDua().obs;
  var objPompa = statusPompaAir().obs;
  var objOtomatis = Otomatis().obs;

  Future<void> initData() async {
    dbRef1.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      objSatu.value = ModelSatu.fromJson(data as Map);
    });
    dbRef2.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      objDua.value = ModelDua.fromJson(data as Map);
    });
    pompaAir.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      objPompa.value = statusPompaAir.fromJson(data as Map);
    });
    setAuto.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      objOtomatis.value = Otomatis.fromJson(data as Map);
    });
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
