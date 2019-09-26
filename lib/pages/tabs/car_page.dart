import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/counter.dart';

class CarPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 200,),
          Number(),
          MyButton()
        ],
      ),
    );
  }
}

class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<Counter>(
          builder: (context,child,counter){
            return Text("${counter.num}");
          }),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: (){
        Provide.value<Counter>(context).add();
      },
      child: Text("按钮"),
    );
  }
}

