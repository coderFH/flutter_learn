//按照上面的定义方式, 我们定义一个完整的函数:
int sum(num num1, num num2) {
  return num1 + num2;
}
//Effective Dart建议对公共的API, 使用类型注解, 但是如果我们省略掉了类型, 依然是可以正常工作的
sum1(num1, num2) {
  return num1 + num2;
}

// 另外, 如果函数中只有一个表达式, 那么可以使用箭头语法(arrow syntax)
// 注意, 这里面只能是一个表达式, 不能是一个语句
sum2(num1, num2) => num1 + num2;

// ----------   可选参数
// 可选参数可以分为 命名可选参数 和 位置可选参数
// 命名可选参数
printInfo1(String name, {int age, double height}) {
  print('name=$name age=$age height=$height');
}

// 定义位置可选参数
printInfo2(String name, [int age, double height]) {
  print('name=$name age=$age height=$height');
}

// 命名可选参数, 可以指定某个参数是必传的(使用@required, 有问题)
// printInfo3(String name, {int age, double height, @required String address}) {
//   print('name=$name age=$age height=$height address=$address');
// }

// 参数可以有默认值, 在不传入的情况下, 使用默认值
// 注意, 只有可选参数才可以有默认值, 必须参数不能有默认值
// 参数的默认值
printInfo4(String name, {int age = 28, double height=1.75}) {
  print('name=$name age=$age height=$height');
}

main(List<String> args) {
  // 调用printInfo1函数
  printInfo1('why'); // name=why age=null height=null
  printInfo1('why', age: 18); // name=why age=18 height=null
  printInfo1('why', age: 18, height: 1.88); // name=why age=18 height=1.88
  printInfo1('why', height: 1.88); // name=why age=null height=1.88

  //位置可选参数的演示:
  // 调用printInfo2函数
  printInfo2('why'); // name=why age=null height=null
  printInfo2('why', 18); // name=why age=18 height=null
  printInfo2('why', 18, 1.88); // name=why age=18 height=1.88

  // printInfo3("why",address: "北京");

  printInfo4("why");
}




