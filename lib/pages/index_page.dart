import 'package:flutter/material.dart';
import '../pages/tabs/home_page.dart';
import '../pages/tabs/category_page.dart';
import '../pages/tabs/car_page.dart';
import '../pages/tabs/mine_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _IndexPageState();
  }
}

class _IndexPageState extends State<IndexPage>{
  final List<BottomNavigationBarItem> bottomTabs=[
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text("首页")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.category),
        title: Text("分类")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        title: Text("购物车")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.people),
        title: Text("我的")
    ),
  ];

  final List<Widget> tabBodies=[
    HomePage(),
    CategoryPage(),
    CarPage(),
    MinePage()
  ];

  var currentIndex=0;

  @override
  Widget build(BuildContext context) {
    //屏幕适配
    ScreenUtil.instance=ScreenUtil(width: 750,height: 1334)..init(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottomTabs,
        currentIndex: currentIndex,
        onTap: (v){
          setState(() {
            this.currentIndex=v;
          });
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: tabBodies,
      ),
    );
  }
}