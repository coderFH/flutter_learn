main(List<String> args) {
  final p = Person();

  p.name = "wfh"; //直接访问属性
  print(p.name);

  //通过setter和getter访问
  p.setName = 'tmac';
  print(p.getName);
  
}

class Person {
  String name;

  //setter
  set setName(String name) => this.name = name;

  //getter
  String get getName => name;
}