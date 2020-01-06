class Person {
  String name;
  int age;
  double height;

  Person(String name,{int age,double height}) {
    this.name = name;
    this.age = age;
    this.height = height;
  }

  void eating() {
    print('$name在吃东西');
  }
}

class Cat {
  String name;
  int age;
  double height;

  Cat(this.name,[this.age,this.height]);

  void eating() {
    print("$name在吃东西");
  }
}

main(List<String> args) {
  var p1 = new Person("wfh",age: 18,height: 1.88);
  p1.eating();

  var p2 = new Person("zs");
  p2.eating();

  var c1 = new Cat("喵喵");
  c1.eating();

  var c2 = new Cat("咪咪",18,1.1);
  c2.eating();
}