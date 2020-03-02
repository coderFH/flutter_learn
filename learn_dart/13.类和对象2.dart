class Person {
  String name;
  int age;

  Person() {
    name = '';
    age = 0;
  }

  Person.fromMap(Map<String,Object> map) {
    this.name = map['name'];
    this.age = map['age'];
  }

  String toString() {
    return 'name = $name age = $age';
  }
} 

main(List<String> args) {
  var p1 = new Person();
  print(p1);
  var p2 = Person.fromMap({'name':'t-mac','age':30});
  print(p2);
}
