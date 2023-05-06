if(models.objOtomatis.value.statusAktif == true) {
    if (models.objSatu.value.statusKeranAir == true) {
        if (models.objSatu.value.sensorDigital! >= parameterMin) {
            if (models.objSatu.value.sensorDigital! <= parameterMax) {
                // OTOMATIS
            }
            else {
                // OTOMATIS
            }
        }
        else {
            // OTOMATIS
        }
    } 
    else {
      if (models.objSatu.value.sensorDigital! >= parameterMin) {
        if (models.objSatu.value.sensorDigital! <= parameterMax) {
          // OTOMATIS
        }
        else {
          // OTOMATIS
        }
      }
      else {
        // OTOMATIS
      }
    }
}
else {
    if (models.objSatu.value.statusKeranAir == true) {
        if (models.objSatu.value.sensorDigital! >= parameterMin) {
            if (models.objSatu.value.sensorDigital! <= parameterMax) {
                databaseReference
                    .child('ProjectTugasAkhirArbi')
                    .child('ObjSampel1')
                    .set(
                    {
                        'StatusKeranAir': false,
                    },
                );
            } 
            else {
                databaseReference
                    .child('ProjectTugasAkhirArbi')
                    .child('ObjSampel1')
                    .set(
                    {
                        'StatusKeranAir': false,
                    },
                );
            }
        } 
        else {
            databaseReference
                .child('ProjectTugasAkhirArbi')
                .child('ObjSampel1')
                .set(
                {
                    'StatusKeranAir': false,
                },
            );
        }
    } 
    else {
        if (models.objSatu.value.sensorDigital! >= parameterMin) {
            if (models.objSatu.value.sensorDigital! <= parameterMax) {
                // TOMBOL AKSI
            }
            else {
                // TOMBOL AKSI
            }
        } 
        else {
            databaseReference
                .child('ProjectTugasAkhirArbi')
                .child('ObjSampel1')
                .set(
                {
                    'StatusKeranAir': true,
                },
            );
        }
    }
}