main(List<String> args) {

  final color = Colors.red;

  switch (color) {
    case Colors.red:
      print("红色");
      break;
    case Colors.blue:
      print("蓝色");
      break;
    case Colors.green:
      print("绿色");
      break;
  }

  print(Colors.values);
  print(Colors.red.index);

  print(Colors.red.index);
  print(Colors.green.index);
  print(Colors.blue.index);
  print(Colors.values);
}

enum Colors {
  red,
  green,
  blue
}

