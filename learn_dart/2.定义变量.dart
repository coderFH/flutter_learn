import 'dart:io';

main(List<String> args) {
  //1.==============================明确的声明==============================
  String name = 'wfh';
  int age = 18;
  double height = 1.89;
  print('${name},${age},${height}');

  //----- 定义的变量可以修改值, 但是不能赋值其他类型
  String content = "hello dart";
  content = "hello world";
  print(content);
  // content = 111; // 错误的, 将一个int值赋值给一个String变量

  //2.==============================类型推导  var/final/const==============================
  //----- var的使用
  var name1 = "wfh";
  name1 = "fhwang";
  print(name1.runtimeType); //String

  var age1 = 18;
  // age = "wfh";  //不可以将String赋值给一个int类型

  //3. ----- dynamic的使用
  // 但是在开发中, 通常情况下不使用dynamic, 因为类型的变量会带来潜在的危险
  dynamic name2 = "wfh";
  print(name2.runtimeType); //String
  name2 = 18;
  print(name2.runtimeType); //int

  //4.final&const的使用
  // final和const都是用于定义常量的, 也就是定义之后值都不可以修改
  final name3 = 'coderFH';
  // name = 'T-mac';  //错误

  const age3 = 18;
  // age3 = 20; // 错误

  // final和const有什么区别呢?
  // const在赋值时, 赋值的内容必须是在编译期间就确定下来的
  // final在赋值时, 可以动态获取, 比如赋值一个函数
  String getName() {
    return "fh";
  }

  // const name4 = getName(); //错误的做法, 因为要执行函数才能获取到值
  final name5 = getName(); //正确

  //final和const小案例:
  // 首先, const是不可以赋值为DateTime.now()
  // 其次, final一旦被赋值后就有确定的结果, 不会再次赋值

  // const time = DateTime.now(); //错误的赋值方式
  final time = DateTime.now();
  print(time); //2019-11-29 10:20:19.269450
  sleep(Duration(seconds:2));
  print(time); //2019-11-29 10:20:19.269450

  // const放在赋值语句的右边，可以共享对象，提高性能:  
  //在Dart2.0之后, const可以省略
  final a = const Person("wfh");
  final b = const Person("wfh");
  print(identical(a,b));  //true

  final m = Person("tmac");
  final n = Person("tmac");
  print(identical(m, n)); // false
}

class Person {
  final String name;
  const Person(this.name);
}