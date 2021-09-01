import 'dart:math' show Random;

main() {
  for (int i = 0; i < 10; i++) {
    if (i % 2 == 0) {
      print('hi');
    }
  }
  for (var x in List.generate(10, (index) => index)) {
    print("${(x % 3 == 0) ? 'foo' : x}");
  }

  var r = Random();
  var i;
  do {
    i = 1 + r.nextInt(6);
    print(i);
  } while (i != 6);

  while (r.nextBool()) {
    print('ende!');
  }
}
