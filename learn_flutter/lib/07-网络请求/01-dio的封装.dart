import 'package:flutter/material.dart';
import 'http_request.dart';


class DioDemo  extends StatefulWidget {
  @override
  _DioDemoState createState() => _DioDemoState();
}

class _DioDemoState extends State<DioDemo> {
  var content = "";

  @override
  void initState() {
    /*
    dio的正常使用方式:
    // 发送网络请求
    //1.创建Dio对象
    final dio = Dio();

    2.发送网络请求
    dio.get("https://httpbin.org/get").then((res) {
      print(res);
    });

    dio.post("https://httpbin.org/post").then((res) {
      print(res);
    });
    * */
//    使用封装的Dio进行请求
    super.initState();
    HttpRequest.request("/get",
        params: {"name": "tmac"})
        .then((res) {
      print(res);
      setState(() {
        content = res.toString();
      });
    }).catchError((err) {});

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dio请求"),
      ),
      body: Container(
        child: Center(
          child: Text(content),
        ),
      ),
    );
  }
}
