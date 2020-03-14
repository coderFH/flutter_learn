import "dart:async";

main(List<String> args) {
  print("main start");

  Future(() => print("task1"));
	
  final future = Future(() => null);

  Future(() => print("task2")).then((_) {
    print("task3");
    scheduleMicrotask(() => print('task4'));
  }).then((_) => print("task5"));

  future.then((_) => print("task6"));
  scheduleMicrotask(() => print('task7'));

  Future(() => print('task8'))
    .then((_) => Future(() => print('task9')))
    .then((_) => print('task10'));

  print("main end");
}

