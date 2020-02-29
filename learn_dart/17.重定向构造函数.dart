main(List<String> args) {
  var p = Person('wfh');
  print(p.age);
}

class Person {
  String name;
  int age;

  Person(String name) : this._internal(name,0);

  Person._internal(this.name,this.age);
}