main(List<String> args) {
  //比如我们现在不想延迟,在Future里return结果后,立马打印,可以这么处理
  Future((){
    return "hello world";
  }).then((res){
    print(res);
  });

  //但其实Future提供了比较方便的API
  Future.value("T-mac").then((res){
    print(res);
  });

  Future.error("我是错误").catchError((err){
    print(err);
  });

  //延时处理
  Future.delayed(Duration(seconds: 2),(){
    return "我是delay方法里的匿名函数";
  }).then((res){
    print(res);
    return "我是.then里发出来的,延迟了两秒";
  }).then((res){
    print(res);
  });

  
}