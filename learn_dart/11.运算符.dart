main(List<String> args) {
  //------ 除法、整除、取模运算
  var num = 7;
  print(num / 3); // 除法操作, 结果2.3333..
  print(num ~/ 3); // 整除操作, 结果2;
  print(num % 3); // 取模操作, 结果1;

  //------ ??=赋值操作
  // dart有一个很多语言都不具备的赋值运算符：
    // 当变量为null时，使用后面的内容进行赋值。
    // 当变量有值时，使用自己原来的值。

  // var name2 = 'kobe';
  var name2 = null;
  name2 ??= 'james'; 
  print(name2); // 当name2初始化为kobe时，结果为kobe，当初始化为null时，赋值了jam

  //条件运算符：
  // var temp = 'why';
  var temp = null;
  var name = temp ?? 'kobe';
  print(name);

  //级联语法
  final p1 = Person();
  p1.name = 'why';
  p1.run();
  p1.eat();
  p1.swim();

  final p2 = Person()
              ..name = "why"
              ..run()
              ..eat()
              ..swim();
} 

class Person {
  String name;

  void run() {
    print("${name} is running");
  }

  void eat() {
    print("${name} is eating");
  }

  void swim() {
    print("${name} is swimming");
  }
}