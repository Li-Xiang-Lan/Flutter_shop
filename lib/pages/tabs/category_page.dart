import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../service/service_method.dart';
import 'package:provide/provide.dart';
import '../../provide/child_category.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("商品分类"),),
      body: Row(
        children: <Widget>[
          LeftCategoryNov(),
          Column(
            children: <Widget>[
              RightCategoryNov()
            ],
          )
        ],
      ),
    );
  }
}

class LeftCategoryNov extends StatefulWidget {
  @override
  _LeftCategoryNovState createState() => _LeftCategoryNovState();
}

class _LeftCategoryNovState extends State<LeftCategoryNov> {
  List<Map> categoryList=new List();
  int clickIndex=0;

  @override
  void initState() {
    super.initState();
    setState(() {
      categoryList=getCategory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(border: Border(right: BorderSide(width: 1,color: Colors.black12))),
      child: ListView.builder(
          itemCount: categoryList.length,
          itemBuilder: (context,index){
            return _inkwellItem(index);
          }),
    );
  }

  Widget _inkwellItem(index){
    return InkWell(
      onTap: (){
        setState(() {
          clickIndex=index;
        });
        Provide.value<ChildCategory>(context).setCategory(index);
      },
      child: Container(
        alignment: Alignment.centerLeft,
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: index==clickIndex?Colors.black12: Colors.white,
          border: Border(bottom: BorderSide(width: 1,color: Colors.black12))
        ),
        child: Text(
          categoryList[index]["name"],
        ),
      ),
    );
  }
}

//右侧顶部导航
class RightCategoryNov extends StatefulWidget {
  @override
  _RightCategoryNovState createState() => _RightCategoryNovState();
}

class _RightCategoryNovState extends State<RightCategoryNov> {
//  List list=["全部","舍得","茅台","郎酒","五粮液","老白干","江小白"];


  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(80),
      width: ScreenUtil().setWidth(750-180),
      child: Provide<ChildCategory>(
        builder: (context,child,category){
          print("=============有效${category.totalMap.toString()}");
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: category.totalMap["title"].length,
              itemBuilder: (context,index){
                return _itemInkwell(category.totalMap["title"][index]);
              }
          );
        },
      ),
    );
  }
  
  Widget _itemInkwell(item){
    return InkWell(
      onTap: (){},
      child: Container(
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(120),
        height: ScreenUtil().setHeight(80),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom:BorderSide(width: 1,color: Colors.black12))
        ),
        child: Text(
          item,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(30)
          ),
        ),
      ),
    );
  }
}

