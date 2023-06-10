class Tuple<T1, T2> {
  final T1 item1;
  final T2 item2;

  Tuple(this.item1, this.item2);

  Tuple<String, String> getTuple() {
  final String value1 = item1 as String;
  final String value2 = item2 as String;

  return Tuple<String, String>(value1, value2);
}

}
