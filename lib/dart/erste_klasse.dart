class ErsteKlasse {
  final String test;
  String _test2;
  String test3;
  static const String TEST_4 = 'test4';
  static int count = 0;

  ErsteKlasse(this.test, String t2,
      {required this.test3, bool doPrint = true, String toPrint = 'Hi'})
      : _test2 = t2 {
    count++;
    if (doPrint) {
      print(toPrint);
      print("I am number $count");
    }
  }

  factory ErsteKlasse.createSecond() {
    return ZweiteKlasse('test from factory', 't2 from factory');
  }

  void methode() {
    print(test);
  }

  get test2 => _test2;
  set test2(value) => _test2 = value;
}

class ZweiteKlasse extends ErsteKlasse {
  late String db;
  ZweiteKlasse(String test, [String t2 = 'default t2'])
      : super(test, t2,
            test3: 'test3 von zweiter Klasse',
            toPrint: 'Hi von zweiter Klasse') {
    db = '    _____\n'
        ' ___ |[]|_n__n_I_c\n'
        '|___||__|###|____}\n'
        ' O-O--O-O+++--O-O';
  }

  @override
  void methode() {
    print(_test2);
    print(db);
  }
}

main() {
  ErsteKlasse k1 =
      ErsteKlasse('test von k1', 'test2 von k1', test3: 'test3 von k1');
  ErsteKlasse k2 = ZweiteKlasse('test von k2');
  ZweiteKlasse k3 = ErsteKlasse.createSecond() as ZweiteKlasse;

  print(k1.test2);
  k1.test2 = 'hallo';
  print(k1.test2);

  k1.methode();
  k2.methode();
  k3.methode();
}
