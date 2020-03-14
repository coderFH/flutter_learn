import 'dart:io';

main(List<String> args) {
  print("main-star");
  var future = getNetData();
  print(future);

  //如果分开写,需要将then的返回结果重新的赋值给future,否则会出错,
  // future = future.then((res){
  //   print(res);
  // });

  // future.catchError((err){
  //   print(err);
  // });

  //上边的写法也可以进行链式调用
  // future.catchError((err){
  //   print(err);
  // }).then((res){
  //   print(res);
  // });

  //先调用then或者catchError,好像先调用catchError的情况下,.then也会走????
  future.then((res){
    print(res);
  }).catchError((err){
    print(err);
  }).whenComplete((){
    print("代码执行完毕");
  });

  print("main-end");

}

Future getNetData() {
  return Future((){
    sleep(Duration(seconds: 3));
    // return "hello world";
    throw Exception("我是一个错误");
  });
}