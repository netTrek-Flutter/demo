class A {
  void printA() {
    print('A');
  }
}

main() {
  A()
    ..printA()
    ..printA();

  var l1 = [1,2, 3];
  var l2 = [3,4,5];

  print([...l1, ...l2]);

  A? a; //null
  a?.printA();

  print(a?? 'x');
}