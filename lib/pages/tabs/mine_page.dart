import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/counter.dart';

class MinePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Provide<Counter>(
          builder: (context,child,counter){
            return Text("${counter.num}");
          },
        )
    );
  }
}