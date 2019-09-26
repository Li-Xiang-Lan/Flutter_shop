import 'package:flutter/material.dart';

class Counter with ChangeNotifier{
  int num=0;
  add(){
    num++;
    notifyListeners();
  }
}