main(List<String> args) {
  makeAdder(num addBy) {
    return (num i) {
      return i + addBy;
    };
  }

  var adder2 = makeAdder(2);
  print(adder2(10)); // 12
  print(adder2(6)); // 8

  var adder5 = makeAdder(5);
  print(adder5(10)); // 15
  print(adder5(6)); // 11
}

