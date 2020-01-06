import 'package:dio/dio.dart';
import 'dart:async';
import "../config/service_url.dart";

Future request(url,{formData}) async {
   try {
    print("开始获取{$url}数据.....");
    Response response;
    Dio dio = Dio();
    dio.options.contentType = "application/x-www-form-urlencoded";
    if (formData == null) {
       response = await dio.post(servicePath[url]);
    } else {
       response = await dio.post(servicePath[url],data: formData);
    }
    if (response.statusCode == 200) {
      print("结束获取{$url}数据成功");
      return response.data;
    } else {
      throw Exception("后端接口出现异常，请检测代码和服务器情况.........");
    }
  } catch(e) {
    print("error:===={$e}");
  }
}