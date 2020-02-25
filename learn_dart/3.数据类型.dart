main(List<String> args) {
  // 1.整数类型int
  int age = 18;
  int hexAge = 0x12;
  print(age);
  print(hexAge);

  // 2.浮点类型double
  double height = 1.88;
  print(height);

  //字符串和数字之间的转化:
  // 字符串和数字转化
  // 1.字符串转数字
  var one = int.parse('111');
  var two = double.parse('12.22');
  print('${one} ${one.runtimeType}'); // 111 int
  print('${two} ${two.runtimeType}'); // 12.22 double

  // 2.数字转字符串
  var num1 = 123;
  var num2 = 123.456;
  var num1Str = num1.toString();
  var num2Str = num2.toString();
  var num2StrD = num2.toStringAsFixed(2); // 保留两位小数
  print('${num1Str} ${num1Str.runtimeType}'); // 123 String
  print('${num2Str} ${num2Str.runtimeType}'); // 123.456 String
  print('${num2StrD} ${num2StrD.runtimeType}'); // 123.46 String

  //3.布尔类型
  // 布尔类型
  var isFlag = true;
  print('$isFlag ${isFlag.runtimeType}');

  //注意: Dart中不能判断非0即真, 或者非空即真
  // Dart的类型安全性意味着您不能使用if(非booleanvalue)或assert(非booleanvalue)之类的代码。
  // var message = 'Hello Dart';
  // // 错误的写法
  // if (message) {
  //   print(message);
  // }

  // 4.字符串类型
  // 1.定义字符串的方式
  var s1 = 'Hello World';
  var s2 = "Hello Dart";
  var s3 = 'Hello\'Fullter';
  var s4 = "Hello'Fullter";

  //可以使用三个单引号或者双引号表示多行字符串:
  // 2.表示多行字符串的方式
  var message1 = '''
              哈哈哈
              呵呵呵
              嘿嘿嘿''';

  //字符串和其他变量或表达式拼接: 使用${expression}, 如果表达式是一个标识符, 那么{}可以省略
  // 3.拼接其他变量
  var name = 'wfh';
  var age1 = 18;
  var height1 = 1.88;
  print('my name is ${name}, age is $age1, height is $height1');

    // 强调: ${变量}, 那么{}可以省略
  var message = "my name is $name, age is $age1, height is $height1";
  var message2 = "name is $name, type is ${name.runtimeType}";
  print(message);
  print(message2);
}