abstract class UrlTypeConverter<T> {
  static const Map<Type, UrlTypeConverter> convertersMap = {
    int: IntUrlConverter(),
  };

  static UrlTypeConverter getConverter(Type type) {
    return UrlTypeConverter.convertersMap[type]?? NoConverter();
  }

  const UrlTypeConverter();

  T convert(String toConvert);
}

class NoConverter extends UrlTypeConverter {
  @override
  convert(String toConvert) {
    throw Error();
  }
}

class IntUrlConverter extends UrlTypeConverter<int> {
  const IntUrlConverter() : super();

  @override
  int convert(String toConvert) {
    return int.parse(toConvert);
  }
}
