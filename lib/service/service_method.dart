import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';


Future getHomePageContent() async{
  try{
    print("开始获取数据......"+homePageContent);
    var dio = new Dio();
    dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded");
    var formData={"lon":"115.02932","lat":"35.76189"};
    var response = await dio.post(homePageContent,data: formData);
    if(response.statusCode==200){
      return response.data;
    }else{
      return "异常";
    }
  }catch(e){
    return print("异常========"+e.toString());
  }
}