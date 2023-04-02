int parameterMax = 90;
int parameterMin = 70;

bool keranBuka = true;
bool keranTutup = false;

if(valueKeran == keranBuka) {
    if(valueSensor >= parameterMin) {
        if(valueSensor <= parameterMax) {
            'Penyiraman Sedang Dilakukan';
        }
        else {
            'Penyiraman Melewati Batas Parameter'
        }
    }
    else {
        'Penyiraman Sedang Dilakukan';
    }   
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
else {
    if(valueSensor >= parameterMin) {
        if(valueSensor <= parameterMax) {
            'Penyiraman Sudah Dilakukan';
        }
        else {
            'Penyiraman Sudah Dilakukan';
        }
    }
    else {
        'Mulai Penyiraman';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    }
}