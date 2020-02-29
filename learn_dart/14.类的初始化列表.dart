main(List<String> args) {
  var p = Person("wfh",age: 30);
  print(p.age);
}

const temp = 20;

class Person {
  final String name;
  final int age;

  //初始化列表
  //如果创建对象时, 有传入一个age, 那么就使用传入的age, 如果没有传入age, 那么使用一个默认值
  // Person(this.name, {int age}): this.age = age ?? 10 {
  // }

  //我这种写法和上边的写法没什么区别,但是为什么源代码中使用初始化列表的方式很多呢?
  //因为这种写法有局限性,这里只能是赋值语句 像:this.age = 10,不能写三元运算符,但初始化列表就可以,例如下边注释的例子
  Person(this.name,{this.age = 10});

  // Person(this.name, {int age}): this.age = temp > 20? 30: 50 {
  // }

  // 保留
  // Person(this.name, {this.age = 10});
}
