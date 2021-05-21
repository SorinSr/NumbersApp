import 'package:flutter/cupertino.dart';

bool showAlert = false;

String validateNumber({int userNumber, int generatedNumber}) {
  print("From metoda aia barosana care valideaza => " +
      userNumber.toString() +
      " " +
      generatedNumber.toString());

  if (userNumber == generatedNumber) {
    print("User guessed correctly!!");
    showAlert = true;
    return "You are right, you guessed correctly! 🎉";
  } else if (userNumber > generatedNumber) {
    print("lower");
    return "Try a lower number 🔽";
  } else if (userNumber < generatedNumber) {
    print("bigger");
    return "Try a bigger number 🔼";
  } else {
    return "Un predicted case! ☠";
  }

}


