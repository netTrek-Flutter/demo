//Integer als Rückgabe- und Paramtetertyp
int timesTwo(int x) {
  return x * 2;
}

int timesFour(int x) => timesTwo(timesTwo(x));

//Funktion als Parameter
int runTwice(int x, int Function(int) f) {
  //Impliziter typ Integer
  for (var i = 0; i < 2; i++) {
    x = f(x);
  }
  return x;
}

//Kein Rückgabewert
void main() {
  print("4 times two is ${timesTwo(4)}");
  print("4 times four is ${timesFour(4)}");
  print("2 x 2 x 2 is ${runTwice(2, timesTwo)}");
}
