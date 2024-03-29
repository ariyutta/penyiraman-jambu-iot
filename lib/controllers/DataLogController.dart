// ignore_for_file: unnecessary_null_comparison, avoid_print, dead_code, unused_local_variable, file_names

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:penyiraman_jambu_iot/models/model_data.dart';

class DataLogController extends GetxController {
  RxBool isHistory = true.obs;
  RxBool statusHistory = false.obs;
  RxList<DataLog> listHistory = <DataLog>[].obs;

  RxList<String> dateHistory = <String>[].obs;

  Query refDB =
      FirebaseDatabase.instance.ref().child('ProjectTugasAkhirArbi/DataLog');

  void historyData() async {
    try {
      if (kDebugMode) {
        print('hellllo');
      }
      isHistory(false);
      refDB.onValue.listen(
        (event) {
          var snapshot = event.snapshot.value;
          Map<String, dynamic> historyMap = {};

          (snapshot as Map).forEach((key, value) {
            String stringKey = key.toString();

            Map<String, dynamic> entry = {};
            value.forEach((subKey, subValue) {
              String stringSubKey = subKey.toString();
              dynamic dynamicValue = subValue;

              entry[stringSubKey] = dynamicValue;
            });

            historyMap[stringKey] = entry;
          });

          List<dynamic> listData = historyMap.values.toList();

          if (snapshot != null) {
            for (var list in listData) {
              DataLog history = DataLog.fromJson(list as Map);
              if (history != null) {
                dateHistory.add(DateFormat('yyyy-MM-dd').format(DateTime.parse(
                    history.waktu ?? DateTime.now().toString())));
              }
              listHistory.add(history);
            }

            listHistory.sort((b, a) =>
                DateTime.parse(a.waktu ?? DateTime.now().toString()).compareTo(
                    DateTime.parse(b.waktu ?? DateTime.now().toString())));
            dateHistory = dateHistory..toSet().toList();
            if (kDebugMode) {
              print(dateHistory);
            }
          }
        },
      );

      isHistory(true);

      if (isHistory.isTrue) {
        statusHistory.isTrue;
      }
    } catch (e) {
      rethrow;
      statusHistory.value = false;
    }
  }

  @override
  void onInit() {
    historyData();
    super.onInit();
  }

  @override
  void dispose() {
    historyData();
    super.dispose();
  }
}
