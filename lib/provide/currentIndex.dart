import 'package:flutter/material.dart';
class CurrentIndexprovide with ChangeNotifier {
  int currentIndex =0 ;
  changeIndex (int index){
    currentIndex = index;
    notifyListeners();
  }
}
