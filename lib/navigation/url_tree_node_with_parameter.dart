import 'custom_route.dart';
import 'url_tree_node.dart';
import 'url_type_converters.dart';

class UrlTreeNodeWithParameter extends UrlTreeNode {
  final String parameterName;
  final UrlTypeConverter converter;

  UrlTreeNodeWithParameter(
      {required PathSegmentParameterConfig config,
        required RouteHandler handler})
      : parameterName = config.parameterName,
        converter = UrlTypeConverter.getConverter(config.type),
        super(pattern: config.pattern, handler: handler);

  @override
  void handleParams(String pathSegment, CustomRouteBuilder routeBuilder) {
    routeBuilder.addParams({parameterName: converter.convert(pathSegment)});
  }
}

class PathSegmentParameterConfig {
  final Type type;
  final String pattern;
  final String parameterName;

  const PathSegmentParameterConfig(
      {required this.type, required this.pattern, required this.parameterName});
}
