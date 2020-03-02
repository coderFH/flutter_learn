//现在有个需求:我需要在传入name和color时,如果单独入的任意相同的name或者相同的color,返回是同一个对象
//如果尝试用常量构造函数解决
class Person {
  final String name;
  final String color = "red";

  const Person(this.name);
  // const Person(this.color);  不支持重载
  // const Persion.withColor(this.color);命名构造函数不支持const修饰
}

//理解核心:普通的构造方法,默认会返回创建的对象,手动返回一个对象,这个时候就用工厂构造函数.
// 普通的构造函数: 会自动返回创建出来的对象, 不能手动的返回
// 工厂构造函数最大的特点: 可以手动的返回一个对象
class FacPerson {
  String name;
  String color;

  static final Map<String, FacPerson> _nameCache = {};
  static final Map<String, FacPerson> _colorCache = {};

  FacPerson(this.name, this.color);

  factory FacPerson.withName(String name) {
    if (_nameCache.containsKey(name)) {
      return _nameCache[name];
    } else {
      final p = FacPerson(name, "default");
      _nameCache[name] = p;
      return p;
    }
  }

  factory FacPerson.withColor(String color) {
    if (_colorCache.containsKey(color)) {
      return _colorCache[color];
    } else {
      final p = FacPerson("default", color);
      _colorCache[color] = p;
      return p;
    }
  }
}

main(List<String> args) {
  //使用常量构造函数只能解决我传name一致时,返回相同的对象,color没法实现.所以这时就用到了工厂构造函数
  const p1 = Person('wfh');
  const p2 = Person('wfh');
  print(identical(p1,p2));

  //工厂构造函数
  print('-----工厂构造函数-----');
  final p3 = FacPerson.withName("wfh");
  final p4 = FacPerson.withName('wfh');
  print(identical(p3,p4));

  final p5 = FacPerson.withName("tmac");
  final p6 = FacPerson.withName('curry');
  print(identical(p5,p6));



  final p7 = FacPerson.withColor("red");
  final p8 = FacPerson.withColor('red');
  print(identical(p7,p8));

  final p9 = FacPerson.withColor("yellow");
  final p10 = FacPerson.withColor('orange');
  print(identical(p9,p10));
}


