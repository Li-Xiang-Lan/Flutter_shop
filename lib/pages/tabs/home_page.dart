import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../util/Util.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("百姓生活+"),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //banner
            MySwiper(swiperList:getHomeBanner()),
            //分类gridview
            CategoryGridView(list: getHomeCategory(),),
            //广告控件
            AdWidget(),
            SizedBox(height: 10,),
            //拨打电话
            LeaderPhone(),
            SizedBox(height: 10),
            //商品推荐
            Recommend(list: getHomeRecommendList()),
            //楼层商品
            FloorGoods(list: getHomeFloorList(),)
          ],
        ),
      ),
    );
  }
}

//顶部banner
class MySwiper extends StatelessWidget {
  final List swiperList;
  MySwiper({this.swiperList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemCount: swiperList.length,
        itemBuilder: (BuildContext context,int index){
          return Image.network(swiperList[index]["image"],fit: BoxFit.cover,);
        },
        pagination: SwiperPagination(alignment: Alignment.bottomRight),
        autoplay: true,
        onTap: (index){
          print(swiperList[index]["image"]);
        },
      ),
    );
  }
}
//分类gridview
class CategoryGridView extends StatelessWidget {
  final List list;
  CategoryGridView({this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(300),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        padding: EdgeInsets.all(5),
        children: list.map((item){
          return _gridViewItemUI(item);
        }).toList(),
      ),
    );
  }


  Widget _gridViewItemUI(item){
    return InkWell(
      onTap: (){print("点击了分类");},
      child: Column(
        children: <Widget>[
//          Image.network(item["image"],fit: BoxFit.cover,),
        CircleAvatar(
          backgroundImage: NetworkImage(item["image"]),
        ),
//          Container(color: Colors.red,height: 100,
//          width: 100,),
          Text(item["name"])
        ],
      ),
    );
  }
}
//广告图片
class AdWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(100),
      child: Row(
        children: <Widget>[
          Expanded(child: Image.network(
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569308463243&di=1230cba763ea98b1870acade17de7b63&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201610%2F06%2F20161006183125_sUk5T.jpeg",
            fit: BoxFit.cover,
          ))
        ],
    ),
    );
  }
}
//拨打电话
class LeaderPhone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _callPhone,
      child: Container(
        height: ScreenUtil().setHeight(200),
        child: Row(children: <Widget>[
          Expanded(child: Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569309064160&di=082df7bc3d26339845c843a90e794479&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20180409%2F3896036181f04fac9e91792f2a726a5f.jpeg",fit:BoxFit.cover))
        ],),
      ),
    );
  }

  void _callPhone() async{
    String url="tel:18980276159";
    if(await canLaunch(url)){
      await launch(url);
    }else{
      showToast("拨打失败");
    }
  }
}
//商品推荐
class Recommend extends StatelessWidget {
  final List list;
  Recommend({this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(440),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommendList()
        ],
      ),
    );
  }

  //商品推荐标题
  Widget _titleWidget(){
    return Container(
      height: ScreenUtil().setHeight(100),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 0.5
          )
        )
      ),
      child: Text(
        "商品推荐",
        style: TextStyle(
          color: Colors.pink
        ),
      ),
    );
  }

  //商品item
  Widget _item(index){
    return InkWell(
      onTap: (){},
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setHeight(250) ,
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(200),
              width:ScreenUtil().setHeight(250) ,
              child: Image.network(list[index]["image"],fit: BoxFit.cover,),
            ),
            SizedBox(height: 5,),
            Text("￥${list[index]["price"]}"),
            Text(
              "￥${list[index]["oldPrice"]}",
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
                fontSize: 12
              ),
            ),
          ],
        ),
      ),
    );
  }

  //横向列表

  Widget _recommendList(){
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context,index){
            return _item(index);
        }
        ),
    );
  }
}
//楼层商品
class FloorGoods extends StatelessWidget {
  final List list;
  FloorGoods({this.list});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(1280),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context,index){
          return Column(
                children: <Widget>[
                  _floorTitle(list[index]),
                  _firstRow(list[index]),
                  _secondColum(list[index])
                ]
            );
      }),
    );
  }

  //楼层标题
  Widget _floorTitle(item){
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            height: ScreenUtil().setHeight(160),
            padding: EdgeInsets.only(top: 10,bottom: 10),
            child: Image.network(item["titleUrl"],fit: BoxFit.cover,),
          ),
        )
      ],
    );
  }
  //第一层row
  Widget _firstRow(item){
    return Container(
      height: ScreenUtil().setHeight(320),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                flex: 1,
                child:Image.network(item["content"][0],fit: BoxFit.cover,)
            ),
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child:Image.network(item["content"][1],fit: BoxFit.cover,)
                    ),
                    Expanded(
                        flex: 1,
                        child:Image.network(item["content"][2],fit: BoxFit.cover,)
                    ),
                  ],
                )
            )
          ],
      ),
    );
  }
  //第二层row
  Widget _secondColum(item){
    return Container(
      height: ScreenUtil().setHeight(160),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              flex: 1,
              child:Image.network(item["content"][3],fit: BoxFit.cover,)
          ),
          Expanded(
              flex: 1,
              child:Image.network(item["content"][4],fit: BoxFit.cover,)
          ),
        ],
      ),
    );
  }
}









