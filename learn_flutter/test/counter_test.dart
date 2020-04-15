import 'package:flutter_test/flutter_test.dart';
import 'package:learn_flutter/15-测试/tool/counter.dart';

void main() {
  group("Counter Class Test", (){
    Counter counter;

    //所有测试test开始前会执行的代码
    setUpAll((){
      counter = Counter(); //这里对counter进行初始化
    });

    test("counter default value", (){
      expect(counter.value, 0);
    });

    test("counter increment method test", (){
      counter.increment();
      expect(counter.value, 1);
    });

    test("counter decrement method test", (){
      counter.decrement();
      expect(counter.value, 0);
    });
  });
}