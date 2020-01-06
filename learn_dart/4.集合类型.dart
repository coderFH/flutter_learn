main(List<String> args) {
  // 1.----- List定义
  // 1.使用类型推导定义
  var letters = ['a', 'b', 'c', 'd'];
  print('$letters ${letters.runtimeType}');

  // 2.明确指定类型
  List<int> numbers = [1, 2, 3, 4];
  print('$numbers ${numbers.runtimeType}');

  //2.----- set
  // Set的定义
  // 1.使用类型推导定义
  var lettersSet = {'a', 'b', 'c', 'd'};
  print('$lettersSet ${lettersSet.runtimeType}');

  // 2.明确指定类型
  Set<int> numbersSet = {1, 2, 3, 4};
  print('$numbersSet ${numbersSet.runtimeType}');

  //3.----- map
  // Map的定义
  // 1.使用类型推导定义
  var infoMap1 = {'name': 'wfh', 'age': 18};
  print('$infoMap1 ${infoMap1.runtimeType}');

  // 2.明确指定类型
  Map<String, Object> infoMap2 = {'height': 1.88, 'address': '北京市'};
  print('$infoMap2 ${infoMap2.runtimeType}');


  // 集合的常见操作
  //第一类，是所有集合都支持的获取长度的属性length：
  // 获取集合的长度
  print(letters.length);
  print(lettersSet.length);
  print(infoMap1.length);

  //是添加/删除/包含操作
  //并且,对List来说，由于元素是有序的，它还提供了一个删除指定索引位置上元素的方法
  // 添加/删除/包含元素
  numbers.add(5);
  numbersSet.add(5);
  print('$numbers $numbersSet');

  numbers.remove(1);
  numbersSet.remove(1);
  print('$numbers $numbersSet');

  print(numbers.contains(2));
  print(numbersSet.contains(2));

  // List根据index删除元素
  numbers.removeAt(3);
  print('$numbers');

  //是Map的操作
  // Map的操作
  // 1.根据key获取value   
  print(infoMap1['name']); // wfh

  // 2.获取所有的entries
  print('${infoMap1.entries} ${infoMap1.entries.runtimeType}'); // (MapEntry(name: wfh), MapEntry(age: 18)) MappedIterable<String, MapEntry<String, Object>>

  // 3.获取所有的keys
  print('${infoMap1.keys} ${infoMap1.keys.runtimeType}'); // (name, age) _CompactIterable<String>

  // 4.获取所有的values
  print('${infoMap1.values} ${infoMap1.values.runtimeType}'); // (wfh, 18) _CompactIterable<Object>

  // 5.判断是否包含某个key或者value
  print('${infoMap1.containsKey('age')} ${infoMap1.containsValue(18)}'); // true true

  // 6.根据key删除元素
  infoMap1.remove('age');
  print('${infoMap1}'); // {name: wfh}










}