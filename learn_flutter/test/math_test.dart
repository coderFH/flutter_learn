import 'package:flutter_test/flutter_test.dart';
import 'package:learn_flutter/15-%E6%B5%8B%E8%AF%95/tool/math_utils.dart';

void main() {
  group("test math utils file", (){ //想有多个test,可以放到group里
    test("math utils test", (){
      final result = sum(20, 30);
      expect(result, 50);
    });

    test("math utils finle mul test", (){
      final result = mul(20, 30);
      expect(result, 600);
    });
  });
}