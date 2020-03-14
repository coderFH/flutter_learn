import 'dart:io';

main(List<String> args) {
  print("main start");

  getData().then((res) {
    print("最终的结果+$res");
  }).catchError((err) {
  });

  print("main end");
}

Future getData() async {
  // 1.调用第一次网络请求
  // getNetworkData("argument1").then((res) {
  //   print(res);
  //   return getNetworkData(res);
  // }).then((res) {
  //   print(res);
  //   return getNetworkData(res);
  // }).then((res) {
  //   print(res);
  // });

  var res1 = await getNetworkData("argument1");
  print(res1);
  var res2 = await getNetworkData(res1);
  print(res2);
  var res3 = await getNetworkData(res2);
  return res3;
}

Future getNetworkData(String arg) {
  return Future(() {
    sleep(Duration(seconds: 3));
    return "Hello World" + arg;
  });
}
