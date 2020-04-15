import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("learn flutter application test", (){
    //1.创建驱动
    FlutterDriver diver;

    //2.连接驱动
    setUpAll(() async {
      diver = await FlutterDriver.connect();
    });

    tearDownAll((){
      diver.close();
    });

    final textFinder = find.byValueKey("textKey");
    final buttonFinder = find.byValueKey("buttonKey");

    test("01-InheritedWidget text default value", () async {
      expect(await diver.getText(textFinder), "当前计数:100");
    });

    test("01-InheritedWidget floatingactionbutton click", () async{
      await diver.tap(buttonFinder);
      expect(await diver.getText(textFinder), "当前计数:101");
    });
  });
}


//flutter drive --target=test_driver/app.dart
//具体测试的时候请点进8-状态管理->状态管理-InheritedWidget 下进行测试
