import 'dart:math';

class Calculator {

  Calculator({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculatorBMI() {
    _bmi = weight / pow(height/100, 2);
  return _bmi.toStringAsFixed(1);
  }

  String getResult () {
    if (_bmi >= 25){
      return 'Overweight';
    } else if (_bmi> 18.5){
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if (_bmi >= 25){
      return 'You have overweight, you should take care of your health';
    } else if (_bmi> 18.5){
      return 'You\'re in normal range of weight, keep caring of yoursealf ';
    } else {
      return 'You are underweight, you should take care of your health';
    }
  }


}
