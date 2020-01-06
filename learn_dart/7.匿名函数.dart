main(List<String> args) {
  // 1.定义数组
  var movies = ['盗梦空间', '星际穿越', '少年派', '大话西游'];

  // 2.使用forEach遍历: 有名字的函数
  printElement(item) {
    print(item);
  }
  movies.forEach(printElement);

  print("-------");
  // 3.使用forEach遍历: 匿名函数
  movies.forEach((item) {
    print(item);
  });

  print("-------");
  movies.forEach((item) => print(item));
}

