int parameterMax = 90;
int parameterMin = 70;

bool keranBuka = true;
bool keranTutup = false;

if(valueKeran == keranBuka) {
    if(valueSensor >= parameterMin) {
        if(valueSensor < parameterMax) {
            'Penyiraman Melewati Batas Parameter';
        }
        else {
            'ERROR!'
        }
    }
    else {
        'Penyiraman Sedang Dilakukan';
    }   
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
else {
    if(valueSensor > parameterMin) {
        if(valueSensor < parameterMax) {
            'Penyiraman Secara Drainase';
        }
    }
    else if(valueSensor == parameterMin) {
        'Penyiraman Sudah Dilakukan';
    }
    else {
        'Mulai Penyiraman';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    }
}