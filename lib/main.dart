import 'package:flutter/material.dart';
import 'pages/index_page.dart';
import 'package:provide/provide.dart';
import 'provide/counter.dart';
import 'provide/child_category.dart';

void main(){
  var providers = Providers();
  providers
    ..provide(Provider<Counter>.value(Counter()))
    ..provide(Provider<ChildCategory>.value(ChildCategory()));
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: MaterialApp(
        title: "百姓生活+",
        theme: ThemeData(
            primaryColor: Colors.pink
        ),
        home: IndexPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}