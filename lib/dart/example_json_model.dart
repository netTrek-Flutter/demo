/// firstName : "John"
/// lastName : "Smith"
/// isAlive : true
/// age : 27
/// address : {"streetAddress":"21 2nd Street","city":"New York","state":"NY","postalCode":"10021-3100"}
/// phoneNumbers : [{"type":"home","number":"212 555-1234"},{"type":"office","number":"646 555-4567"}]
/// children : []
/// spouse : null

class ExampleJsonModel {
  String? _firstName;
  String? _lastName;
  bool? _isAlive;
  int? _age;
  Address? _address;
  List<PhoneNumbers>? _phoneNumbers;

  String? get firstName => _firstName;
  String? get lastName => _lastName;
  bool? get isAlive => _isAlive;
  int? get age => _age;
  Address? get address => _address;
  List<PhoneNumbers>? get phoneNumbers => _phoneNumbers;

  ExampleJsonModel({
    String? firstName,
    String? lastName,
    bool? isAlive,
    int? age,
    Address? address,
    List<PhoneNumbers>? phoneNumbers,
  }) {
    _firstName = firstName;
    _lastName = lastName;
    _isAlive = isAlive;
    _age = age;
    _address = address;
    _phoneNumbers = phoneNumbers;
  }

  ExampleJsonModel.fromJson(dynamic json) {
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _isAlive = json['isAlive'];
    _age = json['age'];
    _address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    if (json['phoneNumbers'] != null) {
      _phoneNumbers = [];
      json['phoneNumbers'].forEach((v) {
        _phoneNumbers?.add(PhoneNumbers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['isAlive'] = _isAlive;
    map['age'] = _age;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    if (_phoneNumbers != null) {
      map['phoneNumbers'] = _phoneNumbers?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// type : "home"
/// number : "212 555-1234"

class PhoneNumbers {
  String? _type;
  String? _number;

  String? get type => _type;
  String? get number => _number;

  PhoneNumbers({String? type, String? number}) {
    _type = type;
    _number = number;
  }

  PhoneNumbers.fromJson(dynamic json) {
    _type = json['type'];
    _number = json['number'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['type'] = _type;
    map['number'] = _number;
    return map;
  }
}

/// streetAddress : "21 2nd Street"
/// city : "New York"
/// state : "NY"
/// postalCode : "10021-3100"

class Address {
  String? _streetAddress;
  String? _city;
  String? _state;
  String? _postalCode;

  String? get streetAddress => _streetAddress;
  String? get city => _city;
  String? get state => _state;
  String? get postalCode => _postalCode;

  Address(
      {String? streetAddress,
      String? city,
      String? state,
      String? postalCode}) {
    _streetAddress = streetAddress;
    _city = city;
    _state = state;
    _postalCode = postalCode;
  }

  Address.fromJson(dynamic json) {
    _streetAddress = json['streetAddress'];
    _city = json['city'];
    _state = json['state'];
    _postalCode = json['postalCode'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['streetAddress'] = _streetAddress;
    map['city'] = _city;
    map['state'] = _state;
    map['postalCode'] = _postalCode;
    return map;
  }
}
