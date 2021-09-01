timesTwo(x) {
  return x * 2;
}

timesFour(x) => timesTwo(timesTwo(x));

runTwice(x, f) {
  for (var i = 0; i < 2; i++) {
    x = f(x);
  }
  return x;
}

main() {
  //String Extrapolation durch $var oder ${code}
  print("4 times two is ${timesTwo(4)}");
  print("4 times four is ${timesFour(4)}");
  print("2 x 2 x 2 is ${runTwice(2, timesTwo)}");
}
