import 'dart:io';

main(List<String> args) {
  print("main---star");
  Future((){
    sleep(Duration(seconds: 2));
    return "我是第一次的返回结果";
  }).then((res){
    print(res);
    sleep(Duration(seconds: 2));
    // return "我是第二次的返回结果";
    throw Exception("第二次请求结果失败了");
  }).then((res){
    print(res);
    sleep(Duration(seconds: 2));
    return "我是第三次的返回结果";
  }).then((res){
    print(res);
  }).catchError((err){
    print(err);
  }).whenComplete((){
    print("执行完毕了");
  });
  print("main---end");
}