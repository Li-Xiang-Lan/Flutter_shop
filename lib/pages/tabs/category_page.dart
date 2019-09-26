import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../service/service_method.dart';

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
          LeftCategoryNov()
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
            return _inkwellItem(categoryList[index]);
          }),
    );
  }

  Widget _inkwellItem(item){
    return InkWell(
      onTap: (){},
      child: Container(
        alignment: Alignment.centerLeft,
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1,color: Colors.black12))
        ),
        child: Text(
          item["name"],
        ),
      ),
    );
  }
}

