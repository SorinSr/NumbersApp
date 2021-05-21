import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String getNumberShape({String numberString}) {
  double number = double.parse(numberString);

  bool _isSquare= false;
  bool _isCube =false;

  for(int i = 0; i <= ((number/2)+1); i++){
    if ((i*i) == number) {
      _isSquare = true;
      print("Is "+numberString+" square? ::  YASSS  "+_isSquare.toString());
    }
    if ((i*i*i) == number) {
      _isCube = true;
      print("Is "+numberString+" cube? ::  YASSSSSSS  "+_isCube.toString());
    }
  }

  //4096, 729

  if (_isCube && _isSquare) {
    return "Number : " + number.toStringAsFixed(0) + "\nIs square and cube in the same time!";
  } else if (_isCube) {
    return "Number : " + number.toStringAsFixed(0) + "\nIs cube!";
  } else if (_isSquare) {
    return "Number : " + number.toStringAsFixed(0) + "\nIs square!";
  } else {
    print("Is "+numberString+" square? NOOOO!! :(");
    return "Number : " + number.toStringAsFixed(0) + "\nIs neither square or cube!";
  }
}
