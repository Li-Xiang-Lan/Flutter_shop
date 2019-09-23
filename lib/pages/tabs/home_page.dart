import 'package:flutter/material.dart';
import '../../service/service_method.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{

  @override
  void initState() {
    super.initState();
    getHomePageContent().then((value){
      print("返回数据："+value.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("首页"),);
  }
}