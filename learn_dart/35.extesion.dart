main(List<String> args) {
  final String message = "hello world";

  final result = message.fh_split(" ");

  print(result);
}

extension StrSplit on String {
  List<String> fh_split(String split) {
    return this.split(split);
  }
}