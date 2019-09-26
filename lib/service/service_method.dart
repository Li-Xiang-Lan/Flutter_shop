import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';


//Future getHomePageContent() async{
//  try{
//    print("开始获取数据......"+homePageContent);
//    var dio = new Dio();
//    dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded");
//    var formData={"lon":"115.02932","lat":"35.76189"};
//    var response = await dio.post(homePageContent,data: formData);
//    if(response.statusCode==200){
//      return response.data;
//    }else{
//      return "异常";
//    }
//  }catch(e){
//    return print("异常========"+e.toString());
//  }
//}

List<Map> getHomeBanner(){
  return [{"image":"http://b-ssl.duitang.com/uploads/item/201305/26/20130526140022_5fMJe.jpeg", "url":"https://www.baidu.com"},
    {"image":"http://b.zol-img.com.cn/soft/6/571/cepyVKtIjudo6.jpg","url":"https://www.baidu.com"},
    {"image":"http://b-ssl.duitang.com/uploads/item/201210/04/20121004233010_y2xNS.jpeg", "url":"https://www.baidu.com"},
    {"image":"http://www.leawo.cn/attachment/201404/16/1433365_1397624557Bz7w.jpg", "url":"https://www.baidu.com"},
    {"image":"http://img.ph.126.net/tUmAKo2mJ5kbaxbvxdVmbA==/2507379092555461040.jpg", "url":"https://www.baidu.com"}
  ];
}

List<Map> getHomeCategory(){
  return [{"name":"白酒","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569306242526&di=f382065ec6c8d49cc6ff0af4cc242908&imgtype=0&src=http%3A%2F%2Fimg.sccnn.com%2Fbimg%2F337%2F31452.jpg"},
  {"name":"红酒","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569306242526&di=2e80c69c1497f82db9d1c843e10abae0&imgtype=0&src=http%3A%2F%2Fpic.qiantucdn.com%2F58pic%2F11%2F36%2F20%2F75e58PICDJE.jpg"},
  {"name":"啤酒","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569306242525&di=8be0cb7d0c1de111cddda8271a740823&imgtype=0&src=http%3A%2F%2Fimg.ph.126.net%2FOPdm0-Rje91G2WaZSP6kWQ%3D%3D%2F3339419123695749442.jpg"},
  {"name":"葡萄酒","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569306242525&di=1c19eaf35b24c80f4455aa52b2454713&imgtype=0&src=http%3A%2F%2Fimg.ph.126.net%2FD127zo5kIES4-roPh3gemw%3D%3D%2F3275524303983314359.jpg"},
  {"name":"黄酒","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569306242525&di=7334bcc03887a0e0986e3038a64ae104&imgtype=0&src=http%3A%2F%2Fimg.sccnn.com%2Fbimg%2F337%2F28719.jpg"},
  {"name":"鸡尾酒","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569306242525&di=a0cac6f3aa462b8a3fd6f7c39405ceb0&imgtype=0&src=http%3A%2F%2Fimg.ph.126.net%2FjqfvW8qWylc2BAAZxHlMsQ%3D%3D%2F1099441259048744937.jpg"},
  {"name":"假酒","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569306242525&di=569f661b004452787dd7773758a26c55&imgtype=0&src=http%3A%2F%2Fimg.bimg.126.net%2Fphoto%2Fur3aix5SO7piLcySYr2dnw%3D%3D%2F5787125521171287308.jpg"},
  {"name":"醉酒","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569306242525&di=2f119bf2db763f552af96ad30dbd1cc2&imgtype=0&src=http%3A%2F%2Fimg.ph.126.net%2FETaB5uM6Axg9mplkYzmaGA%3D%3D%2F2603362059613727460.jpg"},
  {"name":"白兰地","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569306242524&di=1063a6a86658ad6fab46e10e184f419f&imgtype=0&src=http%3A%2F%2Fimage2.sina.com.cn%2Fent%2Fm%2Fp%2F2007-04-27%2FU1513P28T3D1536254F326DT20070427142412.jpg"},
  {"name":"梅子酒","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569306242524&di=a2d9a4e9ccd458dc5d47fd4bf7b6047d&imgtype=0&src=http%3A%2F%2Fpic49.nipic.com%2Ffile%2F20140922%2F2531170_191654419000_2.jpg"},
  ];
}

List<Map> getHomeRecommendList(){
  return [
    {"price":"100","oldPrice":"200","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569323641092&di=f877310d8aea5da97bdbd7f9ec36a41b&imgtype=0&src=http%3A%2F%2Fimage5.huangye88.cn%2F2013%2F03%2F17%2F54807a24f324677f.jpg"},
    {"price":"100","oldPrice":"200","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569323641091&di=4fd05833481343e41c96780d9148f5a7&imgtype=0&src=http%3A%2F%2Fpic162.nipic.com%2Ffile%2F20180419%2F17561636_084224220032_2.jpg"},
    {"price":"100","oldPrice":"200","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569323641090&di=e5f109bcdfc05e244a65f40f066e46ab&imgtype=0&src=http%3A%2F%2Fpic75.nipic.com%2Ffile%2F20150818%2F20967877_101425828000_2.jpg"},
    {"price":"100","oldPrice":"200","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569323641090&di=292e7686eb20dd9538e78f6f6f6367a2&imgtype=0&src=http%3A%2F%2Fimg004.hc360.cn%2Fg1%2FM01%2FBC%2F43%2FwKhQL1KEpMqESNj7AAAAAHh0ZhQ650.jpg"},
    {"price":"100","oldPrice":"200","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569323641089&di=b917596512ee5bfadcf952932bcbadd7&imgtype=0&src=http%3A%2F%2Fpic18.nipic.com%2F20120106%2F7453907_174008794000_2.jpg"},
    {"price":"100","oldPrice":"200","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569323641087&di=5bb11766130042f08f6e94598eac641e&imgtype=0&src=http%3A%2F%2Fimg2.makepolo.net%2Fimages%2Fformals%2Fimg%2Fproduct%2F702%2F747%2F972ea313c1f2280e8326e8d4c65e2374.jpg"},
    {"price":"100","oldPrice":"200","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569323641084&di=07829a971d12dcd6d6a37b0fec61d971&imgtype=0&src=http%3A%2F%2Fpic.sooshong.com%2Fpicture%2Fuserpic2%2F2014-10-25%2F69249720141025133608.jpg"},
    {"price":"100","oldPrice":"200","image":"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2885999970,1292116150&fm=26&gp=0.jpg"},
    {"price":"100","oldPrice":"200","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569323705075&di=74c1245bd2da00ae33d29f4208862e59&imgtype=0&src=http%3A%2F%2Fpic11.nipic.com%2F20101126%2F3542933_195402005683_2.jpg"},
    {"price":"100","oldPrice":"200","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569323705072&di=77a6ed273c4bb0d7b82f80d178858145&imgtype=0&src=http%3A%2F%2Fpic5.nipic.com%2F20100104%2F51824_150443012791_2.jpg"},
  ];
}

List<Map> getHomeFloorList(){
  return [
    {
      "titleUrl":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569327288449&di=c1176e4ce14193764a09e9c5626d43ce&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F10%2F58%2F20%2F53bOOOPIC1e.jpg",
      "content":[
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569327405332&di=4ad2afe98afbce347902487f88455ff5&imgtype=0&src=http%3A%2F%2Fpic25.nipic.com%2F20121126%2F3995638_011457692000_2.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569327405332&di=75ecfe7199108b6caaf6c72027712f1b&imgtype=0&src=http%3A%2F%2Fimg009.hc360.cn%2Fm2%2FM00%2FF5%2F37%2FwKhQclQ_VW-Ea2nqAAAAALLbkPo022.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569327405332&di=1c336ed4b16a0ed77e654fdc9fa66f7c&imgtype=0&src=http%3A%2F%2Fimg006.hc360.cn%2Fm6%2FM04%2F30%2F44%2FwKhQolUwzf2Eari5AAAAAAKAZ4A447.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569327405332&di=c23518ceb84e2b6ea5cd13ec7bd53796&imgtype=0&src=http%3A%2F%2Fimg008.hc360.cn%2Fm6%2FM0F%2F6A%2F6F%2FwKhQoVXtNNGEIJksAAAAAIrglNY96.jpeg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569327405331&di=996dac164faee1618a6289378a477d9c&imgtype=0&src=http%3A%2F%2Fimg007.hc360.cn%2Fg2%2FM06%2F1C%2FB0%2FwKhQuFJeb1CEWXXrAAAAAH0Uvho413.jpg"
      ]
    },
    {
      "titleUrl":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569327354298&di=f9f87ec531dea68a4f6590fa57f19c87&imgtype=0&src=http%3A%2F%2Fpic15.nipic.com%2F20110701%2F2541847_154423751163_2.jpg",
      "content":[
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569327405332&di=def3382fcee7d1b51f9e66fd0d9743cc&imgtype=0&src=http%3A%2F%2Fimg011.hc360.cn%2Fg2%2FM06%2F45%2FBF%2FwKhQuFLfLl-EakIIAAAAAGqrml0128.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569327405331&di=785c057529c80da9f84de9786fcb6763&imgtype=0&src=http%3A%2F%2Fimg000.hc360.cn%2Fm7%2FM0F%2FE0%2F42%2FwKhQo1VdVweEBL8NAAAAAPHE2Rk591.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569327405331&di=6d8464b39afb237286802c57f01d18d1&imgtype=0&src=http%3A%2F%2Fimg010.hc360.cn%2Fg1%2FM09%2F18%2F01%2FwKhQMVJd6jeEc0yqAAAAAD8O1kQ455.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569327405330&di=de73262a49c36ed22bac56141a315ad7&imgtype=0&src=http%3A%2F%2Fimg000.hc360.cn%2Fg2%2FM02%2F61%2FA5%2FwKhQuVL009WEPcWvAAAAAMo8ZkM068.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569327405330&di=8d07664d2ce05412b59f39e26c5b3c55&imgtype=0&src=http%3A%2F%2Fimg010.hc360.cn%2Fg7%2FM05%2F3C%2FD7%2FwKhQs1NnB6iETzrKAAAAAMp-1Is503.jpg"
      ]
    }
  ];
}


List<Map> getHomeHotGoodsList(){
  return [
    {"name":"名字1","price":"100","oldPrice":"200","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569323641092&di=f877310d8aea5da97bdbd7f9ec36a41b&imgtype=0&src=http%3A%2F%2Fimage5.huangye88.cn%2F2013%2F03%2F17%2F54807a24f324677f.jpg"},
    {"name":"名字2","price":"100","oldPrice":"200","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569323641091&di=4fd05833481343e41c96780d9148f5a7&imgtype=0&src=http%3A%2F%2Fpic162.nipic.com%2Ffile%2F20180419%2F17561636_084224220032_2.jpg"},
    {"name":"名字3","price":"100","oldPrice":"200","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569323641090&di=e5f109bcdfc05e244a65f40f066e46ab&imgtype=0&src=http%3A%2F%2Fpic75.nipic.com%2Ffile%2F20150818%2F20967877_101425828000_2.jpg"},
    {"name":"名字4","price":"100","oldPrice":"200","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569323641090&di=292e7686eb20dd9538e78f6f6f6367a2&imgtype=0&src=http%3A%2F%2Fimg004.hc360.cn%2Fg1%2FM01%2FBC%2F43%2FwKhQL1KEpMqESNj7AAAAAHh0ZhQ650.jpg"},
    {"name":"名字5","price":"100","oldPrice":"200","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569323641089&di=b917596512ee5bfadcf952932bcbadd7&imgtype=0&src=http%3A%2F%2Fpic18.nipic.com%2F20120106%2F7453907_174008794000_2.jpg"},
    {"name":"名字6","price":"100","oldPrice":"200","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569323641087&di=5bb11766130042f08f6e94598eac641e&imgtype=0&src=http%3A%2F%2Fimg2.makepolo.net%2Fimages%2Fformals%2Fimg%2Fproduct%2F702%2F747%2F972ea313c1f2280e8326e8d4c65e2374.jpg"},
    {"name":"名字7","price":"100","oldPrice":"200","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569323641084&di=07829a971d12dcd6d6a37b0fec61d971&imgtype=0&src=http%3A%2F%2Fpic.sooshong.com%2Fpicture%2Fuserpic2%2F2014-10-25%2F69249720141025133608.jpg"},
    {"name":"名字8","price":"100","oldPrice":"200","image":"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2885999970,1292116150&fm=26&gp=0.jpg"},
    {"name":"名字9","price":"100","oldPrice":"200","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569323705075&di=74c1245bd2da00ae33d29f4208862e59&imgtype=0&src=http%3A%2F%2Fpic11.nipic.com%2F20101126%2F3542933_195402005683_2.jpg"},
    {"name":"名字10","price":"100","oldPrice":"200","image":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569323705072&di=77a6ed273c4bb0d7b82f80d178858145&imgtype=0&src=http%3A%2F%2Fpic5.nipic.com%2F20100104%2F51824_150443012791_2.jpg"}
  ];
}

List<Map> getCategory(){
  List<Map> list=new List();
  for(var i=0;i<=20;i++){
    Map<String,String> map=new Map();
    for(var j=0;j<=20;j++){
      map.addAll({"name":"商品名字$i-$j","price":"100","oldPrice":"200","image":"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2885999970,1292116150&fm=26&gp=0.jpg"},);
    }
    list.add({"name":"分类名字$i","content":map});
  }
  return list;
}