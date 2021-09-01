int integer = 3;
String string1 = "Hello ", string2 = "World!";

List<int> list = [1, 2, 3, 4];

Map<String, String> map = {'a': "Hello", 'b': "World"};

Set<String> set = {'a', 'b', 'c'};

void addElement(List<int> l) {
  l.add(5);
}

int addOne(int i) {
  i++; //i += 1;
  return i;
}

main() {
  print(string1 + string2);

  print(integer);
  print(addOne(integer));
  print(integer);

  print(list);
  addElement(list);
  print(list);

  print(map['a']);

  print(set.difference({'a', 'd'}));
}
