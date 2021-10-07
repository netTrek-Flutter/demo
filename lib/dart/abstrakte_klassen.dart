abstract class AbstractParent {
  void printMyMessage() {
    print(myMessage);
  }

  abstract final String myMessage;
}

class Child extends AbstractParent {
  @override
  String get myMessage => "MyMessage von Child";
}

abstract class WhoAmI {
  void whoami();
}

mixin MyMixin on Child implements WhoAmI {
  void whoami() {
    print("I'm MyMixin, $myMessage");
  }
}

class WithMixin extends Child with MyMixin {
  WithMixin() {
    whoami();
  }
}

class ImplementsInterface implements AbstractParent {
  @override
  String get myMessage => 'ungenutzt';

  @override
  void printMyMessage() {
    print('Ich implementiere alles von meinem Interface!');
  }
}

main() {
  Child().printMyMessage();
  WithMixin();
  ImplementsInterface().printMyMessage();
}