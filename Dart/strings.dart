void main() {
  // raw string
  String raw = r'\n treated as normal string';
  print(raw);

  // normal string
  String normal = 'It\'s is a normal string';
  print(normal);

  // string interpolation
  String cell_phone_type = 'android';
  String message = "My cell is of $cell_phone_type type";
  print(message);

  // multi-line string
  String multiLine = '''
    I can write
    the sentence
    in multiple lines.
  ''';
  print(multiLine);

  // type conversion
  var value1 = int.parse('123');
  assert(value1 == 123);
  var value2 = double.parse('11.223');
  assert(value2 == 11.223);
  print("Value1: $value1, Value2: $value2");

  String str1 = value1.toString();
  String str2 = value2.toStringAsFixed(2);
  print("Str1: $str1, Str2: $str2");
}
