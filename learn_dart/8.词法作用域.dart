var name = 'global';
main(List<String> args) {
  var name = 'main';
  void foo() {
    // var name = 'foo';
    print(name);
  }

  foo();
}

