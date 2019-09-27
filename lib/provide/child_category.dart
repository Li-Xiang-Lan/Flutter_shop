import 'package:flutter/material.dart';
import '../service/service_method.dart';

class ChildCategory with ChangeNotifier{
  Map<String,List> totalMap={"title":["全部0","舍得0","茅台0","郎酒0","五粮液0","老白干0","江小白0"]};
  setCategory(index){
    var category = getCategory();
    var map = category[index];
    var list=["全部$index","舍得$index","茅台$index","郎酒$index","五粮液$index","老白干$index","江小白$index"];
    totalMap.addAll({"title":list,"content":map["content"]});
    print("========${map.toString()}");
    notifyListeners();
  }
}