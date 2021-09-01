int a(int a, [int b = 0]) {
  return a + b;
}

int b({required int a, int b = 0}) {
  return a + b;
}

main() {
  print(a(5));
  print(a(5, 3));

  print(b(a: 5));
  print(b(b: 3, a: 5));
}
