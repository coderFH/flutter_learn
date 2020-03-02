//在某些情况下，传入相同值时，我们希望返回同一个对象，这个时候，可以使用常量构造方法.

main(List<String> args) {
  //const可以省略
  const p1 = const Person("wfh");
  const p2 = Person("wfh");

  print(identical(p1,p2));
}

class Person {
  final String name;
  const Person(this.name);
}