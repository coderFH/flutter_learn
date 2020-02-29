main(List<String> args) {
  
  final s = Shape(); //Shape实现了工厂构造方法,所以可以实例化了

  final map = Map();
  //既然抽象类不能实例化,点进Map()的源代码我们发现,Map也是抽象类,为什么他能实例化?
  /*
  首先,抽象类是不能通过普通的构造函数去实例化,但是我们可以通过工厂构造函数去实例化
  点击Map()实现的源代码中,我们可以看到external factory Map();
  但是我们看到他源代码并没有实现具体的代码,这是因为external关键字,它会将方法的声明和实现分离
  在其他的源码中,可以找到@patch,就是对这些被external声明的方法的实现
  这么做的好处是可以针对不同的平台(iOS,Android),进行不同的实现
  */
}

//注意二:抽象类不能实例化
abstract class Shape {
  //抽象类定义的方法可以实现,也可以不实现
  int getArea();
  String getInfo() {
    return '形状';
  }


  factory Shape() {
    // return Shape(); 记住,不能这么写,因为这样会死循环,应该返回他的一个子类
    return Rectangle();
  }
}

//注意一: 抽象类中的抽象方法必须被子类实现,所以不想每个方法都实现,可以在抽象类的方法中弄一个空实现
// 抽象类中的已经被实现方法, 可以不被子类重写.
class Rectangle extends Shape {
  @override
  int getArea() {
    return 100;
  }

  Rectangle();
  
  factory Rectangle() : super() {
    return  Rectangle();
  }
}